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
                <main class="principal">
                    <!-- Seleccionamos los articulos a los que queremos aplicar la plantilla -->
                    <xsl:apply-templates select="//articulo"/>
                </main>
            </body>

            <footer>
                <address>&#169; Desarrollado por info@birt.eus</address>
            </footer>

        </html>
    </xsl:template>

    <!-- Plantilla para articulos -->
    <xsl:template match="articulo">
        <article>

            <section>
                <!-- Al pasar la plantilla por cada nodo <articulo> evaluamos y recuperamos la información del atributo @foto que es la ruta relativa de la imagen -->
                <img class="articulo" src="{@foto}" />
            </section>

            <section>
                <h2><xsl:value-of select="precio"/> €</h2>
                <!-- Usamos la función count(comentarios) que nos devuelve la cantidad de elementos <comentarios> dentro de cada nodo articulo -->
                <h3>Comentarios: <xsl:value-of select="count(comentarios)"/></h3>
                <!-- Anidamos los comentarios a los que queremos aplicar una plantilla -->
                <ul><xsl:apply-templates select="comentarios"/></ul>
            </section>
            
        </article>
    </xsl:template>

    <!-- Plantilla para comentarios -->
    <xsl:template match="comentarios">
        <li><xsl:value-of select="./@fecha"/>: <xsl:value-of select="."/></li>
    </xsl:template>

</xsl:stylesheet>