Return-Path: <na-hoan@jinso.co.jp>
Subject: Re: [PATCH] drm: rcar-du: Re-update the DSYSR register value for
 start/stop
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
 <35008313.pubLakprOv@avalon>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <02fe926f-0f60-3106-1d83-8f4fa27995e2@jinso.co.jp>
Date: Wed, 24 Oct 2018 09:16:51 +0900
MIME-Version: 1.0
In-Reply-To: <35008313.pubLakprOv@avalon>
Content-Type: multipart/alternative;
 boundary="------------432AF9C99235862C76CE5E3D"
Content-Language: en-US
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------432AF9C99235862C76CE5E3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Laurent-san

On 2018/10/22 20:23, Laurent Pinchart wrote:
> Hello Hoan,
>
> Thank you for the patch.
>
> On Monday, 22 October 2018 09:30:54 EEST Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>>  From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to ensure
>> known initial value"
> What exact commit are you referring to ? The mainline commit that has this
> subject is 9144adc5e5a99577bce0d4ee2ca3615f53b9d296.
>
>> We only need to update DSYSR0, DSYSR2 for start/stop.
>> So using rgrp-> mmio_offset is enough, the change back from rcar_du_crtc ->
>> rcar_du_group -> rcar_du_crtc leading to mmio addresses for DSYSR may be
>> different.
> Is this fixing an actual problem ? If you look at the code, the line
>
> 	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
>
> makes sure that we select DU0 or DU2 only, so the register write
>
> 	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
> 				   start ? DSYSR_DEN : DSYSR_DRES);
>
> should only access DSYSR0 and DSYSR2.

Dear Laurent-san

I add information about the current error occurring at M3N-r8a77965

when probe rcar-du driver:

/[   13.027115] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* 
[CRTC:55:crtc-2] flip_done timed out//
//[   23.267103] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
[CRTC:55:crtc-2] flip_done timed out//
//[   33.507102] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
[CONNECTOR:57:VGA-1] flip_done timed out//
//[   43.747100] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
[PLANE:30:plane-1] flip_done timed out//
//[   53.987100] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* 
[CRTC:55:crtc-2] flip_done timed out//
//[   53.989913] Console: switching to colour frame buffer device 128x48//
//[   64.227102] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
[CRTC:55:crtc-2] flip_done timed out//
//[   74.467099] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
[CONNECTOR:57:VGA-1] flip_done timed out//
//[   84.707100] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* 
[PLANE:30:plane-1] flip_done timed out//
//[   94.947100] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR* 
[CRTC:55:crtc-2] flip_done timed out//
//[   95.040076] rcar-du feb00000.display: fb0: DRM emulated frame 
buffer device//
//[   95.047747] [drm] Initialized rcar-du 1.0.0 20130110 for 
feb00000.display on minor 0//
//[   95.055512] [drm] Device feb00000.display probed//
//[   95.061252] bd9571mwv 7-0030: Device: BD9571MWV rev. 4/

on renesas-drivers/renesas-drivers-2018-10-09-v4.19-rc7

Thank you!

Hoan.


>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
>>   drivers/gpu/drm/rcar-du/rcar_du_group.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_group.c index d85f0a1..a5f7eed 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>> @@ -202,10 +202,9 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
>>
>>   static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool
>> start) {
>> -	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
>> -
>> -	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
>> -				   start ? DSYSR_DEN : DSYSR_DRES);
>> +	rcar_du_group_write(rgrp, DSYSR,
>> +			(rcar_du_group_read(rgrp, DSYSR) & ~(DSYSR_DRES | DSYSR_DEN)) |
>> +			(start ? DSYSR_DEN : DSYSR_DRES));
>>   }
>>
>>   void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)

--------------432AF9C99235862C76CE5E3D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Laurent-san</p>
    <div class="moz-cite-prefix">On 2018/10/22 20:23, Laurent Pinchart
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:35008313.pubLakprOv@avalon">
      <pre class="moz-quote-pre" wrap="">Hello Hoan,

Thank you for the patch.

On Monday, 22 October 2018 09:30:54 EEST Nguyen An Hoan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Hoan Nguyen An <a class="moz-txt-link-rfc2396E" href="mailto:na-hoan@jinso.co.jp">&lt;na-hoan@jinso.co.jp&gt;</a>

>From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to ensure
known initial value"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What exact commit are you referring to ? The mainline commit that has this 
subject is 9144adc5e5a99577bce0d4ee2ca3615f53b9d296.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We only need to update DSYSR0, DSYSR2 for start/stop.
So using rgrp-&gt; mmio_offset is enough, the change back from rcar_du_crtc -&gt;
rcar_du_group -&gt; rcar_du_crtc leading to mmio addresses for DSYSR may be
different.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this fixing an actual problem ? If you look at the code, the line

	struct rcar_du_crtc *rcrtc = &amp;rgrp-&gt;dev-&gt;crtcs[rgrp-&gt;index * 2];

makes sure that we select DU0 or DU2 only, so the register write

	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
				   start ? DSYSR_DEN : DSYSR_DRES);

should only access DSYSR0 and DSYSR2.</pre>
    </blockquote>
    <p>Dear Laurent-san</p>
    <p>I add information about the current error occurring at
      M3N-r8a77965 <br>
    </p>
    <p>when probe rcar-du driver:</p>
    <blockquote> </blockquote>
    <p><font size="-1"><i>[   13.027115]
          [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*
          [CRTC:55:crtc-2] flip_done timed out</i><i><br>
        </i><i> [   23.267103]
          [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
          [CRTC:55:crtc-2] flip_done timed out</i><i><br>
        </i><i> [   33.507102]
          [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
          [CONNECTOR:57:VGA-1] flip_done timed out</i><i><br>
        </i><i> [   43.747100]
          [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
          [PLANE:30:plane-1] flip_done timed out</i><i><br>
        </i><i> [   53.987100]
          [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*
          [CRTC:55:crtc-2] flip_done timed out</i><i><br>
        </i><i> [   53.989913] Console: switching to colour frame buffer
          device 128x48</i><i><br>
        </i><i> [   64.227102]
          [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
          [CRTC:55:crtc-2] flip_done timed out</i><i><br>
        </i><i> [   74.467099]
          [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
          [CONNECTOR:57:VGA-1] flip_done timed out</i><i><br>
        </i><i> [   84.707100]
          [drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
          [PLANE:30:plane-1] flip_done timed out</i><i><br>
        </i><i> [   94.947100]
          [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*
          [CRTC:55:crtc-2] flip_done timed out</i><i><br>
        </i><i> [   95.040076] rcar-du feb00000.display: fb0: DRM
          emulated frame buffer device</i><i><br>
        </i><i> [   95.047747] [drm] Initialized rcar-du 1.0.0 20130110
          for feb00000.display on minor 0</i><i><br>
        </i><i> [   95.055512] [drm] Device feb00000.display probed</i><i><br>
        </i><i> [   95.061252] bd9571mwv 7-0030: Device: BD9571MWV rev.
          4</i></font><br>
    </p>
    <blockquote> </blockquote>
    <p>on renesas-drivers/renesas-drivers-2018-10-09-v4.19-rc7<br>
    </p>
    <p>Thank you!</p>
    Hoan.
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:35008313.pubLakprOv@avalon">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Hoan Nguyen An <a class="moz-txt-link-rfc2396E" href="mailto:na-hoan@jinso.co.jp">&lt;na-hoan@jinso.co.jp&gt;</a>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c
b/drivers/gpu/drm/rcar-du/rcar_du_group.c index d85f0a1..a5f7eed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -202,10 +202,9 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)

 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool
start) {
-	struct rcar_du_crtc *rcrtc = &amp;rgrp-&gt;dev-&gt;crtcs[rgrp-&gt;index * 2];
-
-	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
-				   start ? DSYSR_DEN : DSYSR_DRES);
+	rcar_du_group_write(rgrp, DSYSR,
+			(rcar_du_group_read(rgrp, DSYSR) &amp; ~(DSYSR_DRES | DSYSR_DEN)) |
+			(start ? DSYSR_DEN : DSYSR_DRES));
 }

 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------432AF9C99235862C76CE5E3D--
