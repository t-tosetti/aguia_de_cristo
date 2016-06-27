//
//  LocalizationViewController.swift
//  AguiaDeCristo
//
//  Created by Thiago Tosetti Lopes on 10/02/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocalizationViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var coordenada: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    private let latitude: Double = -23.44862
    private let longitude: Double = -46.503262

    private var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparaTela()
        
        mapView.addAnnotation(AguiaAnnotation(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)))

    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        pedirAutorizacao()
//    }
//    
//    func pedirAutorizacao() {
//        // checar se o aparelho tem localizacao
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager = CLLocationManager()
//            
//            // podemos ajustar a precisão
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//            
//            // status atual de autorização
//            switch CLLocationManager.authorizationStatus() {
//                // .AuthorizedAlways: tem permissão de usar localizacao mesmo com o aplicativo fechado (monitoramento)
//                // .AuthorizedWhenInUse: tem permissão para usar localizacao quando o app estiver aberto.
//            case .AuthorizedAlways, .AuthorizedWhenInUse:
//                print("localização autorizada")
//                
//                // .NotDetermined: o usuário ainda não escolheu
//            case .NotDetermined:
//                // se ainda não ecolheu vamos exibir o alerta pedindo autorizacao
//                locationManager?.requestWhenInUseAuthorization()
//                // NOTA: precisamos adicionar uma chave (NSLocationWhenInUseUsageDescription) no Info.plist com a descrição do motivo para usar a localização
//                
//                // .Restricted: usuário tem restricao para aceitar localizacao (controle parental ou de empresa)
//                // .Denied: usuário negou o acesso a localizacao
//            case .Restricted, .Denied:
//                // mostrar alerta falando como aletrar a permissão
//                print("localizacao negada")
//                mostrarAlertaLocalizacaoNegada()
//            }
//        }
//    }
//    
//    func mostrarAlertaLocalizacaoNegada() {
//        let alerta = UIAlertController(title: "Localização Negada", message: "Favor habilitar a localização em Ajustes > Privacidade > Serv. de Localização", preferredStyle: .Alert)
//        
//        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
//        
//        let acaoIrAjustes = UIAlertAction(title: "Ir para Ajustes", style: .Default) { botao in
//           
//            // 1. URL do Ajustes (padrão)
//            let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)!
//            UIApplication.sharedApplication().openURL(settingsURL)
//        }
//        
//        alerta.addAction(acaoIrAjustes)
//        
//        // exibir alerta
//        presentViewController(alerta, animated: true, completion: nil)
//    }
    
    // MARK: - Traçar Rota
    
        
//     @IBAction func tracarRotaAPe(sender: UIButton) {
//        
//        let origem = MKPlacemark(coordinate: mapView.userLocation.coordinate, addressDictionary: nil)
//        
//        let destino = MKPlacemark(coordinate: coordenada, addressDictionary: nil)
//        
//        //fazer requisição para o sistema de direções (MKDirectionsRequest)
//        let requisicao = MKDirectionsRequest()
//        requisicao.transportType = .Walking
//        requisicao.source = MKMapItem(placemark: origem)
//        requisicao.destination = MKMapItem(placemark: destino)
//        
//        // executar o request, recebendo as direções
//        let direcoes = MKDirections(request: requisicao)
//        direcoes.calculateDirectionsWithCompletionHandler { resposta, erro in
//            // caso a resposta seja valida, precisamos desenhar no mapa
//            guard let resposta = resposta else {
//                print(erro)
//                return
//            }
//            
//            // podemos receber multiplas rotas, nesse caso estamos usando somente a primeira
//            guard let rota = resposta.routes.first else {
//                print("rota não encontrada")
//                return
//            }
//            
//            // as rotas tem algumas propriedades interessantes
//            print("Rota: \(rota.name)")
//            print("Distância: \(rota.distance)m")
//            print("TEC: \(rota.expectedTravelTime)s")
//            
//            // rotas tem trechos
//            for trecho in rota.steps {
//                print("Em \(trecho.distance)m \(trecho.instructions)")
//            }
//            
//            dispatch_async(dispatch_get_main_queue()) {
//                // add o desenho no mapa (overlay)
//                self.mapView.addOverlay(rota.polyline, level: MKOverlayLevel.AboveRoads)
//            }
//            
//        }
//
//        var user: CLLocationCoordinate2D {
//            return mapView.userLocation.coordinate
//        }
//        
//    
//        centralizarNaCoordenada(user)
//        
//    }
    
    func centralizarNaCoordenada(centro: CLLocationCoordinate2D) {
        // zoom
        let span = MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
        //juntando o centro e o zoom em uma regiao
        let regiao = MKCoordinateRegion(center: centro, span: span)
        
        // centralizar mapa na regiao
        mapView.setRegion(regiao, animated: true)
    }

    
    func preparaTela() {
        // mapa
        // centralizar restaurante e ajustar o zoom
        centralizarNaCoordenada(coordenada)
    }

}


extension LocalizationViewController: MKMapViewDelegate {
    // customizatr a view (pino) que aparece para uma anotação
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        switch annotation {
        case is MKPointAnnotation:
            
            let pino = MKPinAnnotationView(
                annotation: annotation,
                reuseIdentifier: "PinoID"
            )
            
            // mudar cor do pino
            pino.pinTintColor = UIColor.blackColor()
            // animar queda
            pino.animatesDrop = true
            
            return pino
            
        case let pino as AguiaAnnotation:
            return pino.annotationView()
            
        default:
            // IMPORTANTE: para usar a view padrão, return nil
            return nil
        }
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blueColor()
        renderer.lineWidth = 5.0
        
        return renderer
    }
}


