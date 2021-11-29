echo "Configuring stardog:"
/opt/stardog/bin/stardog-admin db create -u admin -p admin -n PD_KG
/opt/stardog/bin/stardog-admin db offline PD_KG
/opt/stardog/bin/stardog-admin metadata set -o reasoning.type=QL -- PD_KG
/opt/stardog/bin/stardog-admin metadata set -o graph.aliases=true -- PD_KG
/opt/stardog/bin/stardog-admin metadata set -o graphql.auto.schema=true -- PD_KG
/opt/stardog/bin/stardog-admin metadata set -o search.enabled=true -- PD_KG
/opt/stardog/bin/stardog-admin metadata set -o reasoning.schema.graphs=http://postdata.linhd.uned.es/onto_graph -- PD_KG
/opt/stardog/bin/stardog-admin metadata set -o search.index.properties.excluded=http:\/\/postdata.linhd.uned.es/ontology/postdata-poeticAnalysis#content,http:\/\/postdata.linhd.uned.es/ontology/postdata-core#text -- PD_KG
/opt/stardog/bin/stardog-admin metadata set -o search.index.properties.included=http:\/\/postdata.linhd.uned.es/ontology/postdata-core#name -- PD_KG
/opt/stardog/bin/stardog-admin db online PD_KG
/opt/stardog/bin/stardog namespace add PD_KG --prefix pdc --uri http://postdata.linhd.uned.es/ontology/postdata-core#
/opt/stardog/bin/stardog namespace add PD_KG --prefix pdp --uri http://postdata.linhd.uned.es/ontology/postdata-poeticAnalysis#
/opt/stardog/bin/stardog data add -g http://postdata.linhd.uned.es/onto_graph PD_KG "/stardog/OntoPoetry/Core Module/postdata-core.owl"
/opt/stardog/bin/stardog data add -g http://postdata.linhd.uned.es/onto_graph PD_KG "/stardog/OntoPoetry/Poetic Analysis Module/postdata-poeticAnalysis.owl"
/opt/stardog/bin/stardog data add PD_KG --verbose  --compression ZIP -f TURTLE /stardog/postdata_kg_dump.zip
/opt/stardog/bin/stardog-admin user passwd -N ******** -u admin -p admin
