# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	# Order.delete_all

	Location.delete_all
	Vehicle.delete_all
	Mark.delete_all
	ModelCar.delete_all
	Client.delete_all

	Mark.create!(marca_desc: 'ASTON MARTIN',id:1, :photo => File.new("#{Rails.root}/app/assets/images/MARCAS/aston_martin.png")) #1
	Mark.create!(marca_desc: 'AUDI',id:2, :photo => File.new("#{Rails.root}/app/assets/images/MARCAS/audi.png")) #2
	Mark.create!(marca_desc: 'BMW',id:3, :photo => File.new("#{Rails.root}/app/assets/images/MARCAS/bmw.png")) #3
	Mark.create!(marca_desc: 'CHEVROLET',id:4, :photo => File.new("#{Rails.root}/app/assets/images/MARCAS/chevrolet.png")) #4
	Mark.create!(marca_desc: 'FIAT',id:5, :photo => File.new("#{Rails.root}/app/assets/images/MARCAS/fiat.png")) #5
	Mark.create!(marca_desc: 'FORD',id:6, :photo => File.new("#{Rails.root}/app/assets/images/MARCAS/ford.png")) #6
	Mark.create!(marca_desc: 'VOLKSWAGEM',id:7, :photo => File.new("#{Rails.root}/app/assets/images/MARCAS/volkswagem.png")) #7
	# Mark.create!(marca_desc: '')

	ModelCar.create!(modelo_desc: 'CARGA',id:1, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/carga.png")) #1
	ModelCar.create!(modelo_desc: 'CONVERSÍVEL',id:2, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/conversivel.png")) #2
	ModelCar.create!(modelo_desc: 'CROSSOVER',id:3, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/crossover.png")) #3
	ModelCar.create!(modelo_desc: 'ESPORTIVO',id:4, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/esportivo.png")) #4
	ModelCar.create!(modelo_desc: 'HATCH',id:5, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/hatch.png")) #5
	ModelCar.create!(modelo_desc: 'PICK-UP',id:6, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/pick_up.png")) #6
	ModelCar.create!(modelo_desc: 'SEDAN',id:7, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/sedan.png")) #7
	ModelCar.create!(modelo_desc: 'STATION WAGON',id:8, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/wagon.png")) #8
	ModelCar.create!(modelo_desc: 'SUV',id:9, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/suv.png")) #9
	ModelCar.create!(modelo_desc: 'VAN',id:10, :photo => File.new("#{Rails.root}/app/assets/images/MODELOS/van.png")) #10
	# ModelCar.create!(modelo_desc: '')

	Client.create!(
		nome: 'CARLOS',
		idade:29 ,
		telefone: '3020-3010',
		pais: 'BRASIL',
		uf: 'RS',
		cidade: 'PORTO ALEGRE',
		endereco: 'RUA A, 210'
	)
	Client.create!(
		nome: 'ÍSIS',
		idade:19 ,
		telefone: '3090-7753',
		pais: 'BRASIL',
		uf: 'SC',
		cidade: 'CRICIUMA',
		endereco: 'RUA LEAO, 310'
	)
	Client.create!(
		nome: 'TONIES',
		idade:19 ,
		telefone: '',
		pais: 'GUATEMALA',
		uf: '',
		cidade: 'COBÁN',
		endereco: 'RUA NONOS, 298'
	)

	Vehicle.create!(nome: 'A1', preco_loc: 330.0, mark_id: 2, model_car_id: 4, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/a1.png"))
	Vehicle.create!(nome: 'A3', preco_loc: 350.6, mark_id: 2, model_car_id: 7, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/a3.png"))
	Vehicle.create!(nome: 'AMAROK', preco_loc: 280.0, mark_id: 7, model_car_id: 6, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/amarok.png"))
	Vehicle.create!(nome: 'BMW CABRIO', preco_loc: 430.0, mark_id: 3, model_car_id: 2, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/bmw_cabrio.png"))
	Vehicle.create!(nome: 'BMW SÉRIE 3', preco_loc: 500.0, mark_id: 3, model_car_id: 7, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/bmw_serie3.png"))
	Vehicle.create!(nome: 'BMW X4', preco_loc: 450.1, mark_id: 3, model_car_id: 4, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/bmw_x4.png"))
	Vehicle.create!(nome: 'CAPTIVA', preco_loc: 194.1, mark_id: 4, model_car_id: 9, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/captiva.png"))
	Vehicle.create!(nome: 'COBALT', preco_loc: 131.0, mark_id: 4, model_car_id: 7, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/cobalt.png"))
	Vehicle.create!(nome: 'CRUZE SPORT6', preco_loc: 118.4, mark_id: 4, model_car_id: 4, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/cruze_sport6.png"))
	Vehicle.create!(nome: 'DB11', preco_loc: 90.9, mark_id: 1, model_car_id: 4, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/db11.png"))
	Vehicle.create!(nome: 'DOBLÒ', preco_loc: 60.3, mark_id: 5, model_car_id: 10, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/doblo.png"))
	Vehicle.create!(nome: 'DUCATO', preco_loc: 77.4, mark_id: 5, model_car_id: 1, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/ducato.png"))
	Vehicle.create!(nome: 'ECOSPORT', preco_loc: 63.5, mark_id: 6, model_car_id: 3, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/ecosport.png"))
	Vehicle.create!(nome: 'FIESTA', preco_loc: 56.1, mark_id: 6, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/fiesta.png"))
	Vehicle.create!(nome: 'FIORINO 2017', preco_loc: 48.9, mark_id: 5, model_car_id: 1, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/fiorino_2017.png"))
	Vehicle.create!(nome: 'FORD KA', preco_loc: 44.1, mark_id: 6, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/ford_ka.png"))
	Vehicle.create!(nome: 'FORD RANGER', preco_loc: 224.4, mark_id: 6, model_car_id: 6, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/ford_ranger.png"))
	Vehicle.create!(nome: 'FOX', preco_loc: 98.0, mark_id: 7, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/fox.png"))
	Vehicle.create!(nome: 'GOL', preco_loc: 52.7, mark_id: 7, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/gol.png"))
	Vehicle.create!(nome: 'JETTA', preco_loc: 80.7, mark_id: 7, model_car_id: 7, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/jetta.png"))
	Vehicle.create!(nome: 'MOBI', preco_loc: 78.5, mark_id: 5, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/mobi.png"))
	Vehicle.create!(nome: 'MONTANA', preco_loc: 74.5, mark_id: 4, model_car_id: 6, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/montana.png"))
	Vehicle.create!(nome: 'SAVEIRO', preco_loc: 174.0, mark_id: 7, model_car_id: 6, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/onix.png"))
	Vehicle.create!(nome: 'ONIX', preco_loc: 109.2, mark_id: 4, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/onix_joy.png"))
	Vehicle.create!(nome: 'ONIX JOY', preco_loc: 100.6, mark_id: 4, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/prisma.png"))
	Vehicle.create!(nome: 'PRISMA', preco_loc: 80.5, mark_id: 4, model_car_id: 7, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/prisma_joy.png"))
	Vehicle.create!(nome: 'PRISMA JOY', preco_loc: 80.0, mark_id: 4, model_car_id: 7, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/s10.png"))
	Vehicle.create!(nome: 'S10', preco_loc: 250.5, mark_id: 4, model_car_id: 6, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/saveiro.png"))
	Vehicle.create!(nome: 'SIENA', preco_loc: 79.7, mark_id: 5, model_car_id: 7, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/siena.png"))
	Vehicle.create!(nome: 'SPACEFOX', preco_loc: 60.5, mark_id: 7, model_car_id: 8, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/spacefox.png"))
	Vehicle.create!(nome: 'SPIN', preco_loc: 48.0, mark_id: 4, model_car_id: 10, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/spin.png"))
	Vehicle.create!(nome: 'TIGUAN', preco_loc: 69.5, mark_id: 7, model_car_id: 9, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/tiguan.png"))
	Vehicle.create!(nome: 'TORO', preco_loc: 69.0, mark_id: 5, model_car_id: 6, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/toro.png"))
	Vehicle.create!(nome: 'TRACKER', preco_loc: 69.0, mark_id: 4, model_car_id: 9, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/tracker.png"))
	Vehicle.create!(nome: 'UNO', preco_loc: 55.0, mark_id: 5, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/uno.png"))
	Vehicle.create!(nome: 'UP!', preco_loc: 79.1, mark_id: 7, model_car_id: 5, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/up.png"))
	Vehicle.create!(nome: 'VANTAGE', preco_loc: 80.5, mark_id: 1, model_car_id: 4, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/vantage.png"))
	Vehicle.create!(nome: 'WEEKEND', preco_loc: 73.6, mark_id: 5, model_car_id: 8, status: 'DISPONÍVEL',
	:photo => File.new("#{Rails.root}/app/assets/images/VEICULOS/weekend.png"))
	# Vehicle.create!(nome: '', preco_loc: , mark_id: , model_car_id: )