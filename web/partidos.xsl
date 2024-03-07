<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" />
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
                    <h1>PARTIDOS</h1>
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>
                            <!-- Seleccionamos los partidos a las que queremos aplicar la plantilla -->
                            <xsl:apply-templates select="//partido[lugar/@ciudad='Lima']">
                                <!-- Los ordenamos por fecha de mas reciente a menos -->
                                <xsl:sort select="fecha" order="descending" />
                            </xsl:apply-templates>
                    </table>
                    
                </main>

                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>

        </html>
    </xsl:template>

    <!-- Plantilal para partidos -->
    <xsl:template match="partido">
        <tr>
            <td><xsl:value-of select="equipos/local"/><xsl:text> - </xsl:text><xsl:value-of select="equipos/visitante"/></td>
            <td><xsl:value-of select="fecha"/></td>

            <!-- Evaluamos la puntuación y aplicamos la clase "azul" si la puntuación visitante es mayor que la local -->
            <xsl:if test="equipos/visitante/@puntuacion > equipos/local/@puntuacion">
                <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/><xsl:text> - </xsl:text><xsl:value-of select="equipos/visitante/@puntuacion"/></td>
            </xsl:if>

            <!-- Evaluamos la puntuación y la mostramos sin aplicar ninguna clase si la puntuación local es mayor o igual que la visitante -->
            <xsl:if test="equipos/local/@puntuacion >= equipos/visitante/@puntuacion">
                <td><xsl:value-of select="equipos/local/@puntuacion"/><xsl:text> - </xsl:text><xsl:value-of select="equipos/visitante/@puntuacion"/></td>
            </xsl:if>
            
        </tr>
    </xsl:template>

</xsl:stylesheet>