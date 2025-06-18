CREATE KEYSPACE killrvideo
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1 };

USE killrvideo;

CREATE TABLE videos (
    id uuid,
    added_date timestamp,
    title text,
    PRIMARY KEY ((id))
);

COPY videos(id, added_date, title)
FROM '/workspace/DS201-Foundations-of-Apache-Cassandra/data-files/videos.csv'
WITH HEADER=TRUE;

CREATE TABLE videos_by_tag (
    tag text,
    video_id uuid,
    added_date timestamp,
    title text,
    PRIMARY KEY ((tag), added_date, video_id))
    WITH CLUSTERING ORDER BY(added_date DESC);

COPY videos_by_tag(tag, video_id, added_date, title)
FROM '/workspace/DS201-Foundations-of-Apache-Cassandra/data-files/videos-by-tag.csv'
WITH HEADER=TRUE;
