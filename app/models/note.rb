class Note < ApplicationRecord
  validates :university, :degree, :subject, :semester, :description, presence: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  include PgSearch
  pg_search_scope :search,
    against: [ :university, :degree, :subject, :semester, :description, :email ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  # LLORELA = {
  #   universidad_eafit = {
  #     ingeniería_civil: {
  #       semestre_uno = [
  #         "Cálculo i",
  #         "Física i",
  #         "Obras de ingeniería",
  #         "Técnicas de expresión gráfica"
  #       ],
  #       semestre_dos = [
  #         "Cálculo ii",
  #         "Álgebra lineal",
  #         "Física ii",
  #         "Cad para ingeniería civil",
  #         "Estática"
  #         ],
  #       semestre_tres = [
  #         "Cálculo iii",
  #         "Ecuaciones diferenciales",
  #         "Topografía",
  #         "Seminario ingeniería civil",
  #         "Dinámica"
  #         ],
  #       semestre_cuatro = [
  #         "Estadística general",
  #         "Geología física (civil)",
  #         "Mecánica del medio continuo",
  #         "Mecánica de solidos",
  #         "Modelación computacional"
  #         ],
  #       semestre_cinco = [
  #         "Trazado y diseño geométrico de vías",
  #         "Mecánica de suelos básica",
  #         "Mecánica de fluidos",
  #         "Análisis de estructuras",
  #         "Materiales de ingeniería"
  #         ],
  #       semestre_seis = [
  #         "Hidrología",
  #         "Mecánica de suelos aplicada",
  #         "Procesos constructivos",
  #         "Elementos de hormigón reforzado",
  #         "Sistemas de información geográfica"
  #         ],
  #       semestre_siete = [
  #         "Hidráulica aplicada",
  #         "Cimentaciones",
  #         "Programación y presupuesto de construcción",
  #         "Obras de infraestructura",
  #         "Dinámica estructural",
  #         "Acueductos y alcantarillados",
  #         "Pavimentos",
  #         "Diseño de estructuras de hormigón",
  #         "Proyecto 2",
  #         "Diseño de estructuras en acero",
  #         "Sistemas de transporte"
  #       ]
  #     },

  #     ingeniería_de_diseño_de_producto: {
  #       semestre_uno = [
  #         "Modelación matemática",
  #         "Física conceptual",
  #         "Dibujo para la creación",
  #         "Historia y teoría del producto"
  #         ],
  #       semestre_dos = [
  #         "Cálculo ",
  #         "Dibujo para la formalización",
  #         "Modelacion 3d 1",
  #         "Mecánica del artefacto",
  #         "Modelos",
  #         ],
  #       semestre_tres = [
  #         "Cálculo ii",
  #         "Lenguaje de producto",
  #         ],
  #       semestre_cuatro = [
  #         "Cálculo iii",
  #         "Prototipos 1",
  #         "Materiales en el diseño",
  #         ],
  #       semestre_cinco = [
  #         "Ecuaciones diferenciales",
  #         "Procesos y productos",
  #         "Sistemas de ingeniería",
  #         "Creatividad en el diseño",
  #         ],
  #       semestre_seis = [
  #         "Estadística general",
  #         "Mecánica de sólidos y simulación",
  #         "Seminario internacional",
  #         "Fundamentos de mercadeo (l)",
  #         ],
  #       semestre_siete = [
  #         "Mecánica de fluidos y simulación",
  #         "Presentación de proyectos",
  #         "Mercadeo y negociación",
  #         "Ingeniería económica",
  #         ],
  #       semestre_ocho = [
  #         "Administración de operaciones",
  #         "Investigacion de mercados (l)",
  #         "Preparación de proyectos",
  #       ]
  #     },

  #     ingeniería_mecánica: {
  #       semestre_uno = [
  #         "Cálculo i",
  #         "Geometría descriptiva",
  #         "Programación de computadores",
  #         ],
  #       semestre_dos = [
  #         "Cálculo ii",
  #         "Física i",
  #         "Diseño conceptual",
  #         "Estática",
  #         "Taller",
  #         ],
  #           "Procedimiento y contencioso administrativo",
  #         "Ruta de formación I",
  #         "Ruta de formación II",
  #         "Seminario de investigación I",
  #         "Sucesiones",
  #         "Títulos valores",
  #       ],
  #       semestre_nueve = [
  #         "Consultorio jurídico I",
  #         "Contratos mercantiles",
  #         "Derecho canónico",
  #         "Ruta de formación III",
  #         "Ruta de formación IV",
  #         "Ruta de formación V",
  #         "Seminario de investigación II",
  #       ],
  #       semestre_diez = [
  #         "Consultorio jurídico II",
  #         "Ruta optativa de profundización escolar",
  #         "Ruta optativa de profundización práctica",
  #       ],
  #     },
  #   } semestre_tres = [
  #         "Álgebra lineal",
  #         "Física ii",
  #         "Mecánica de sólidos",
  #         "Dinámica",
  #         ],
  #       semestre_cuatro = [
  #         "Fundamentos de fisicoquímica",
  #         "Cálculo iii",
  #         "Mecanismos",
  #         "Procesos numéricos",
  #         ],
  #       semestre_cinco = [
  #         "Ecuaciones diferenciales",
  #         "Mecánica de fluidos",
  #         "Introducción a sistemas cad/cam",
  #         "Materiales",
  #         "Electrotecnia",
  #         ],
  #       semestre_seis = [
  #         "Estadística general",
  #         "Termodinámica",
  #         "Métodos de elementos finitos",
  #         ],
  #       semestre_siete = [
  #         "Métodos cuantitativos",
  #         "Transferencia de calor",
  #         ],
  #       semestre_ocho = [
  #         "Diseño metódico",
  #         "Automatización con matlab",
  #         "Automatización con plc",
  #         "Automatización con labview",
  #         "Ingeniería económica",
  #       ]
  #     },

  #     ingeniería_de_procesos: {
  #       semestre_uno = [
  #         "Fenómenos químicos y laboratorio",
  #         "Cálculo i",
  #         "Física i",
  #         "Introducción a la ingeniería de procesos",
  #         ],
  #       semestre_dos = [
  #         "Cálculo ii",
  #         "Física ii",
  #         ],
  #       semestre_tres = [
  #         "Cálculo iii",
  #         "Álgebra lineal",
  #         "Procesos orgánicos",
  #         "Dinámica de sistemas",
  #         ],
  #       semestre_cuatro = [
  #         "Ecuaciones diferenciales",
  #         "Ciencia de los materiales (procesos)",
  #         "Termodinámica",
  #         "Química instrumental y laboratorio",
  #         "Información científica",
  #         "Programación de computadores",
  #         ],
  #       semestre_cinco = [
  #         "Biología",
  #         "Métodos cuantitativos",
  #         "Balance de materia y energía",
  #         "Estadística y diseño de experimentos",
  #         "Procesos numéricos",
  #         ],
  #       semestre_seis = [
  #         "Gestión de la producción",
  #         "Transferencia de calor y laboratorio",
  #         "Gestión de la calidad",
  #         ],
  #       semestre_siete = [
  #         "Logística inversa",
  #         "Diseño de reactores",
  #         ],
  #       semestre_ocho = [
  #         "Ecología industrial",
  #       ]
  #     },

  #     ingeniería_de_producción: {
  #       semestre_uno = [
  #         "Cálculo i",
  #         "Pensamiento sistémico",
  #         ],
  #       semestre_dos = [
  #         "Fundamentos de fisicoquímica",
  #         "Cálculo ii",
  #         "Álgebra lineal",
  #         "Física i",
  #         "Sistemas de producción 2",
  #         ],
  #       semestre_tres = [
  #         "Ecuaciones diferenciales",
  #         "Física ii",
  #         "Materiales",
  #         "Planeación de la producción",
  #         ],
  #       semestre_cuatro = [
  #         "Cálculo iii",
  #         "Estadística 1",
  #         "Estática",
  #         ],
  #       semestre_cinco = [
  #         "Estadística 2",
  #         "Dinámica",
  #         "Logística industrial",
  #         "Propiedades y ensayos",
  #         ],
  #       semestre_seis = [
  #         "Control de calidad",
  #         "Modelos de decisión",
  #         ],
  #       semestre_siete = [
  #         "Mecánica de sólidos",
  #         ],
  #       semestre_ocho = [
  #         "Costos y presupuestos",
  #         "Gestión de tecnología e innovación",
  #       ]
  #     },

  #     ingeniería_de_sistemas: {
  #       semestre_uno = [
  #         "Cálculo i",
  #         "Lógica",
  #         "Fundamentos de programación",
  #         "Principios de desarrollo de software",
  #         ],
  #       semestre_dos = [
  #         "Cálculo ii",
  #         "Estructuras discretas",
  #         "Física i",
  #         "Lenguajes de programación",
  #         ],
  #       semestre_tres = [
  #         "Cálculo iii",
  #         "Física ii",
  #         "Base de datos",
  #         "Lenguajes formales y compiladores",
  #         ],
  #       semestre_cuatro = [
  #         "Teoría de la organización",
  #         "Teoría de la conmutación",
  #         ],
  #       semestre_cinco = [
  #         "Economía general",
  #         "Pensamiento sistémico",
  #         ],
  #       semestre_seis = [
  #         "Estadística general",
  #         "Ingeniería económica",
  #         "Análisis numérico",
  #         ],
  #       semestre_siete = [
  #         "Métodos cuantitativos",
  #         "Tópicos especiales en sistemas de información",
  #       ]
  #     },

  #     administración_de_negocios: {
  #       semestre_uno = [
  #         "Matemáticas 1",
  #         "Fundamentos de contabilidad",
  #         "Introducción a la economía",
  #         "El mercadeo y el entorno",
  #         "Introducción a la profesión",
  #         ],
  #       semestre_dos = [
  #         "Matemáticas 2",
  #         "Costos para toma de decisiones",
  #         "Derecho empresarial comercial",
  #         "Pensamiento administrativo",
  #         "Estudios empresariales colombianos",
  #         ],
  #       semestre_tres = [
  #         "Matemáticas 3",
  #         "Microeconomía general",
  #         "Matemáticas financieras",
  #         "Mezcla de mercadeo",
  #         "Organizaciones",
  #         ],
  #       semestre_cuatro = [
  #         "Derecho empresarial laboral",
  #         "Macroeconomia general",
  #         "Análisis financiero",
  #         "Administración de procesos",
  #         "Procesos de gestión humana",
  #         "Análisis de datos",
  #         ],
  #       semestre_cinco = [
  #         "Gestión financiera de corto plazo",
  #         "Administración de ventas",
  #         "Teoría de la decisión",
  #         "Administración de operaciones",
  #         ],
  #       semestre_seis = [
  #         "Economía internacional",
  #         "Gestión financiera de largo plazo",
  #         "Comportamiento del consumidor",
  #         "Ética y responsabilidad social",
  #         ],
  #       semestre_siete = [
  #         "Estrategia",
  #         "Administración internacional",
  #         ],
  #       semestre_nueve = [
  #         "Política económica",
  #         "Principios de dirección",
  #         "Política de empresas",
  #       ]
  #     },

  #     negocios_internacionales: {
  #       semestre_uno = [
  #         "Matemáticas 1",
  #         "Derecho empresarial comercial",
  #         "Introducción a la economía",
  #         "Negocios internacionales",
  #         "Fundamentos de administración",
  #         ],
  #       semestre_dos = [
  #         "Matemáticas 2",
  #         "Fundamentos de contabilidad",
  #         "Derecho comercial internacional",
  #         "Mercadeo",
  #         "Teoría de la negociación",
  #         ],
  #       semestre_tres = [
  #         "Matemáticas 3",
  #         "Costos para toma de decisiones",
  #         "Microeconomía general",
  #         "Mercadeo internacional",
  #         "Historia de las relaciones internacionales",
  #         ],
  #       semestre_cuatro = [
  #         "Contratos internacionales",
  #         "Macroeconomia general",
  #         "Transporte internacional",
  #         "Comunicación intercultural",
  #         "Análisis de datos",
  #         ],
  #       semestre_cinco = [
  #         "Economía internacional",
  #         "Matemáticas financieras",
  #         "Geopolítica",
  #         "Relaciones internacionales",
  #         "Teoría de la decisión",
  #         ],
  #       semestre_seis = [
  #         "Análisis financiero",
  #         "Estrategias de internacionalización",
  #         "Régimen de comercio exterior e inversión",
  #         "Asuntos globales",
  #         "Preparación de proyectos",
  #         ],
  #       semestre_siete = [
  #         "Finanzas internacionales",
  #         "Negociación internacional",
  #         "Gestión intercultural",
  #         "Abastecimiento y distribución física internacional",
  #         ],
  #       semestre_nueve = [
  #         "Relaciones públicas y lobby",
  #       ],
  #     },

  #     mercadeo: {
  #       semestre_uno = [
  #         "Matemáticas 1",
  #         "Fundamentos de contabilidad",
  #         "Introducción a la economía",
  #         "Pensamiento de mercadeo",
  #         "Psicología y consumo",
  #         ],
  #       semestre_dos = [
  #         "Matemáticas 2",
  #         "Costos para toma de decisiones",
  #         "Antropología y consumo",
  #         "Administración de producto",
  #         "Fundamentos administrativos y organizacionales",
  #         ],
  #       semestre_tres = [
  #         "Matemáticas 3",
  #         "Microeconomía general",
  #         "Comunicación integrada de mercadeo",
  #         "Análisis sociológico del consumo",
  #         "Innovación y desarrollo de nuevos productos",
  #         ],
  #       semestre_cuatro = [
  #         "Entorno jurídico del mercadeo",
  #         "Macroeconomia general",
  #         "Administración de ventas",
  #         "Métodos de investigación cualitativos",
  #         "Análisis de datos",
  #         ],
  #       semestre_cinco = [
  #         "Economía internacional",
  #         "Administración de canales",
  #         "Métodos de investigación cuantitativos",
  #         "Habilidades de negociación y ventas",
  #         ],
  #       semestre_seis = [
  #         "Matemáticas financieras",
  #         "Ética y responsabilidad social del mercadeo",
  #         "Administración de precios",
  #         "Mercadeo digital",
  #         ],
  #       semestre_siete = [
  #         "Gerencia de marca",
  #         "Gerencia del servicio",
  #         "Estrategias de internacionalización",
  #         "Preparación de proyectos",
  #         ],
  #       semestre_nueve = [
  #         "Tecnologías aplicadas al mercadeo",
  #         "Planeación de mercadeo",
  #         "Evaluación financiera de proyectos",
  #       ],
  #     },

  #     economía: {
  #       semestre_uno = [
  #         "Matemáticas i",
  #         "Fundamentos de contabilidad",
  #         "Técnicas de medición económica",
  #         "Introducción a la economía colombiana",
  #         "Seminario de economía",
  #         ],
  #       semestre_dos = [
  #         "Matemáticas ii",
  #         "Estadística 1 (economía)",
  #         "Álgebra lineal",
  #         "Microeconomía general",
  #         ],
  #       semestre_tres = [
  #         "Matemáticas iii (economía)",
  #         "Estadística 2 (economía)",
  #         "Macroeconomía general",
  #         "Microeconomía intermedia 1",
  #         ],
  #       semestre_cuatro = [
  #         "Pensamiento económico 1",
  #         "Macroeconomía intermedia 1",
  #         "Microeconomía intermedia 2",
  #         "Econometría 1",
  #         "Matemáticas financieras",
  #         ],
  #       semestre_cinco = [
  #         "Pensamiento económico 2",
  #         "Macroeconomía intermedia 2",
  #         "Econometría 2",
  #         "Economía internacional",
  #         ],
  #       semestre_seis = [
  #         "Desarrollo y crecimiento económico",
  #         "Historia económica de colombia",
  #         "Teoría de juegos",
  #       ],
  #     },
  #   },

  #   upb: {
  #     administración_de_empresas: {
  #       semestre_uno = [
  #         "Lenguaje y Cultura",
  #         "Emprendimiento y responsabilidad social",
  #         "Pensamiento Administrativo",
  #         "Matemáticas Operativas",
  #         "Estados financieros",
  #         "Sistemas lineales",
  #         ],
  #       semestre_dos = [
  #         "Humanismo y cultura ciudadana",
  #         "Teoría organizacional",
  #         "Principios de economía",
  #         "Fundamentos de mercadeo",
  #         "Cálculo 1",
  #         "Costos y presupuestos",
  #         ],
  #       semestre_tres = [
  #         "Cristología básica",
  #         "Evolución del pensamiento estratégico",
  #         "Microeconomía",
  #         "Fundamentos jurídicos 1",
  #         "Cálculo 2",
  #         "Estadística 1",
  #         "Ingeniería económica",
  #         ],
  #       semestre_cuatro = [
  #         "Ética General",
  #         "Macroeconomía",
  #         "Estadística 2",
  #         "Cambio y Transformación Organizacional",
  #         "Fundamentos jurídicos 2",
  #         "Administración financiera",
  #         "Comportamiento del consumidor",
  #         ],
  #       semestre_cinco = [
  #         "Ética profesional",
  #         "Línea de Formación Humanista 1",
  #         "Gestión Humana",
  #         "Economía y comercio internacional",
  #         "Finanzas corporativas",
  #         "Investigación y plan de mercadeo estratégico",
  #         "Administración de la producción",
  #         ],
  #       semestre_seis = [
  #         "Línea de formación socio humanista II",
  #         "Gestión de Procesos",
  #         "Coyuntura económica",
  #         "Optimización",
  #         "Investigación 1",
  #         "Prepráctica",
  #         ],
  #       semestre_siete = [
  #         "Ética social",
  #         "Auditoría adtiva y diagnóstico organizacional",
  #         "Formulación y evaluación de proyectos",
  #         "Investigación 2",
  #         "Simulación",
  #         "Gestión Logística Integral",
  #         "Prepráctica",
  #         ],
  #       semestre_ocho = [
  #         "Gerencia estratégica y prospectiva",
  #         "Práctica",
  #       ],
  #     },

  #     derecho: {
  #       semestre_uno = [
  #         "Constitucional General I: Teoría del Estado",
  #         "Cristología",
  #         "Derecho Romano",
  #         "Ética general",
  #         "Humanismo y cultura ciudadana",
  #         "Introducción al Derecho I",
  #         "Lengua y cultura",
  #         "Metodología de la Investigación",
  #       ],

  #       semestre_dos = [
  #         "Civil Familia",
  #         "Constitucional General II: Teoría de la Constitución",
  #         "Electiva I",
  #         "Emprendimiento y responsabilidad social",
  #         "Introducción al Derecho II",
  #         "Lenguaje I",
  #         "Lenguaje II",
  #         "Sistemas jurídicos",
  #       ],
  #       semestre_tres = [
  #         "Bienes",
  #         "Constitucional Colombiano I: Parte Dogmática",
  #         "Electiva II",
  #         "Filosofía del Derecho",
  #         "Lenguaje III",
  #         "Penal General I",
  #         "Teoría general del proceso I",
  #       ],
  #       semestre_cuatro = [
  #         "Análisis Económico del Derecho",
  #         "Constitucional colombiano II: Parte orgánica",
  #         "Ética profesional",
  #         "Hermenéutica y argumentación jurídica",
  #         "Penal General II",
  #         "Sociología Jurídica II",
  #         "Teoría del Negocio Jurídico",
  #         "Teoría general de la prueba y pruebas civiles",
  #         "Teoria general del proceso II",
  #       ],
  #       semestre_cinco = [
  #         "Administrativo general I",
  #         "Comercial general",
  #         "Laboral general e individual",
  #         "Obligaciones",
  #         "Penal especial I",
  #         "Procedimiento civil y laboral - Parte general",
  #         "Procedimiento penal",
  #       ],
  #       semestre_seis = [
  #         "Administrativo general II",
  #         "Contratos I",
  #         "Derecho laboral colectivo",
  #         "Internacional público",
  #         "Métodos alternativos de solución de conflictos",
  #         "Penal especial II",
  #         "Procedimiento civil y laboral - Parte especial",
  #       ],

  #       semestre_siete = [
  #         "Administrativo especial",
  #         "Contratos II",
  #         "Derechos humanos",
  #         "Probatorio penal",
  #         "Seguridad social",
  #         "Sociedades",
  #         "Teoría del derecho",
  #       ],

  #       semestre_ocho = [
  #         "Intervalo privado",
  #         "Procedimiento y contencioso administrativo",
  #         "Ruta de formación I",
  #         "Ruta de formación II",
  #         "Seminario de investigación I",
  #         "Sucesiones",
  #         "Títulos valores",
  #       ],
  #       semestre_nueve = [
  #         "Consultorio jurídico I",
  #         "Contratos mercantiles",
  #         "Derecho canónico",
  #         "Ruta de formación III",
  #         "Ruta de formación IV",
  #         "Ruta de formación V",
  #         "Seminario de investigación II",
  #       ],
  #       semestre_diez = [
  #         "Consultorio jurídico II",
  #         "Ruta optativa de profundización escolar",
  #         "Ruta optativa de profundización práctica",
  #       ],
  #     },
  #   }
  # }
end
