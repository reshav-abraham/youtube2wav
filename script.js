const fs = require('fs');
const ytdl = require('ytdl-core');
//ytdl('http://www.youtube.com/watch?v=A02s8omM_hI').pipe(fs.createWriteStream('video.flv'));
//iterate through links_titles.txt 
var link = process.argv.slice(2)[0]
var title = process.argv.slice(2)[1]
console.log(title);
//https://www.youtube.com/watch?v=oWop9OzZ6d4
ytdl(link, { filter: (format) => format.container === 'mp4' }).pipe(fs.createWriteStream('audioData/'+title+'.mp4'));