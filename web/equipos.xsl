<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" />
    <!-- Guardamos en la variable nombreEntrenador el nombre del entrenador que nos interesa mostrar -->
    <xsl:variable name="nombreEntrenador" select="//equipo[1]/entrenador/nombre"/>
    <xsl:template match="/">
        <html lang="es">

            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>

            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                <main>
                <!-- Evaluamos una expresión XPath para obtener la URL del entrenador -->
                    <h1><a href="{//entrenador[nombre=$nombreEntrenador]/url}"><xsl:value-of select="$nombreEntrenador"/></a></h1>
                    <article class="equipos">
                        <!-- Expresión XPath para obtener el nombre del entrenador -->
                        <h4><xsl:value-of select="//entrenador[nombre=$nombreEntrenador]/../nombre"/></h4>
                        <!-- Seleccionamos los jugadores a los que queremos aplicar la plantilla -->
                        <xsl:apply-templates select="//entrenador[nombre=$nombreEntrenador]/..//jugador"/>
                    </article>
                </main>
            </body>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>

        </html>
    </xsl:template>

    <!-- Plantilla para jugador -->
    <xsl:template match="jugador">

        <!-- Evaluamos el atributo @titular para mostrar o no el número de la camiseta y el nombre del jugador -->
        <xsl:if test="@titular='si'">
            <p><xsl:value-of select="nombre/../@camiseta"/> - <xsl:value-of select="nombre"/></p>
        </xsl:if>
        
    </xsl:template>

</xsl:stylesheet>