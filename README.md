SQL query for a path in QGIS:

    SELECT * FROM pgr_dijkstra(
      '
        SELECT gid AS id,
          source,
          target,
          length AS cost
        FROM ways
      ',
      3803,
      2520,
      directed := false) as route
      join ways on route.edge = ways.gid
