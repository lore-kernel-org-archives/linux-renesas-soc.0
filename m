Return-Path: <SRS0+2Eso=PV=gmail.com=g.liakhovetski@vergenet.net>
From: Guennadi Liakhovetski <g.liakhovetski@gmail.com>
In-Reply-To: <20160325022049.GE31681@verge.net.au>
References: <1458002427-3063-1-git-send-email-horms+renesas@verge.net.au> <20160325022049.GE31681@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----0AORTMWHPINF45ODA420YJGLQMSVHA"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] media: soc_camera: rcar_vin: add fallback and r8a7792 bindings
Date: Fri, 25 Mar 2016 09:53:56 +0100
To: Simon Horman <horms@verge.net.au>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,Magnus Damm <magnus.damm@gmail.com>,linux-media@vger.kernel.org,linux-renesas-soc@vger.kernel.org,Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <0AEE01AE-898E-437B-BBAE-AFCCEC9E187A@gmx.de>
List-ID: <linux-renesas-soc.vger.kernel.org>

------0AORTMWHPINF45ODA420YJGLQMSVHA
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

Hi Simon,

Sorry, I am traveling this and the following 3 weeks, not sure when I next time find time to take care if the patches.

Thanks
Guennadi

Am 25. März 2016 03:20:49 MEZ, schrieb Simon Horman <horms@verge.net.au>:
>On Tue, Mar 15, 2016 at 09:40:25AM +0900, Simon Horman wrote:
>> Hi,
>> 
>> this short series adds add fallback and r8a7792 bindings to rcar_vin.
>> 
>> Based on media-tree/master
>
>Hi Guennadi,
>
>I am wondering if you could consider applying this series too.
>It still applies cleanly on top of media-tree/master.
>
>Thanks in advance!
>
>> 
>> Changes since v3:
>> * Add Acks
>> * Correct typo in changelog
>> 
>> Simon Horman (1):
>>   media: soc_camera: rcar_vin: add device tree support for r8a7792
>> 
>> Yoshihiro Kaneko (1):
>>   media: soc_camera: rcar_vin: add R-Car Gen 2 and 3 fallback
>>     compatibility strings
>> 
>>  Documentation/devicetree/bindings/media/rcar_vin.txt | 12
>++++++++++--
>>  drivers/media/platform/soc_camera/rcar_vin.c         |  2 ++
>>  2 files changed, 12 insertions(+), 2 deletions(-)
>> 
>> -- 
>> 2.1.4
>> 

------0AORTMWHPINF45ODA420YJGLQMSVHA
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>Hi Simon,<br>
<br>
Sorry, I am traveling this and the following 3 weeks, not sure when I next time find time to take care if the patches.<br>
<br>
Thanks<br>
Guennadi<br><br><div class="gmail_quote">Am 25. März 2016 03:20:49 MEZ, schrieb Simon Horman &lt;horms@verge.net.au&gt;:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class="k9mail">On Tue, Mar 15, 2016 at 09:40:25AM +0900, Simon Horman wrote:<br /><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> Hi,<br /> <br /> this short series adds add fallback and r8a7792 bindings to rcar_vin.<br /> <br /> Based on media-tree/master<br /></blockquote><br />Hi Guennadi,<br /><br />I am wondering if you could consider applying this series too.<br />It still applies cleanly on top of media-tree/master.<br /><br />Thanks in advance!<br /><br /><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"> <br /> Changes since v3:<br /> * Add Acks<br /> * Correct typo in changelog<br /> <br /> Simon Horman (1):<br />   media: soc_camera: rcar_vin: add device tree support for r8a7792<br /> <br /> Yoshihiro Kaneko (1):<br />   media: soc_camera: rcar_vin: add R-Car Gen 2 and 3 fallback<br />     compatibility strings<br /> <br /> 
Documentation/devicetree/bindings/media/rcar_vin.txt | 12 ++++++++++--<br />  drivers/media/platform/soc_camera/rcar_vin.c         |  2 ++<br />  2 files changed, 12 insertions(+), 2 deletions(-)<br /> <br /> -- <br /> 2.1.4<br /> <br /></blockquote></pre></blockquote></div></body></html>
------0AORTMWHPINF45ODA420YJGLQMSVHA--
