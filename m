Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:45584 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750884AbdARXEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 18:04:53 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: DongCV <cv-dong@jinso.co.jp>
Cc: Stefan Agner <stefan@agner.ch>,
        Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?utf-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        na-hoan@jinso.co.jp
Subject: Re: The failure summary report of GEN2 for linux stable v4.10-rc2
Date: Thu, 19 Jan 2017 00:47:39 +0200
Message-ID: <1818037.5e1RZkk1rE@avalon>
In-Reply-To: <6c2aea65-951c-1ce4-7339-47023fdb7f13@jinso.co.jp>
References: <1484558970996626000058af@nat.cybozu.com> <d7f4a948-37a2-e912-6e25-5690ad8ecef9@jinso.co.jp> <6c2aea65-951c-1ce4-7339-47023fdb7f13@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Dong,

On Wednesday 18 Jan 2017 15:53:55 DongCV wrote:
> Hi Laurent,
> 
> I found the patch which I think it is the cause of the issues "Does not
> support 640x480 resolution &
> Does not support 16-bit color for numbers," that I have reported.
> The commit name is '865afb1 drm/fb-helper: reject any changes to the fbdev'
> If I reverted this patch and retested it on H2 board, the issue will be
> gone!.

I confirm your analysis. However, I think this isn't a new issue. Before the 
aforementioned patch, running

# fbset -xres 640 -yres 480 -laced 0
# fbset -depth 16 -rgba 5,6,5,0

didn't produce any error, but didn't either resize the display to 640x480 or 
changed the pixel format. With the patch applied, the commands are rejected as 
they should be, as they wouldn't produce the expected results. The new 
behaviour is thus in my opinion correct.

-- 
Regards,

Laurent Pinchart
