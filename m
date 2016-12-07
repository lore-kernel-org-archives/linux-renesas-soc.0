Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8BIT
Message-id: <584785CF.5040201@samsung.com>
Date: Wed, 07 Dec 2016 12:45:19 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, kishon@ti.com,
        Peter.Chen@nxp.com, wens@csie.org,
        yoshihiro.shimoda.uh@renesas.com, maxime.ripard@free-electrons.com,
        b-liu@ti.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, chanwoo@kernel.org
Subject: Re: [PATCH 03/12] power_supply: axp288_charger: Replace the extcon API
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
 <CGME20161130055742epcas1p3cbb269d69275ed6684a7baab0841519b@epcas1p3.samsung.com>
 <1480485460-2663-4-git-send-email-cw00.choi@samsung.com>
 <584605A6.1010803@samsung.com> <20161207030527.n2u4q4tf7po74clg@earth>
In-reply-to: <20161207030527.n2u4q4tf7po74clg@earth>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sebastian,

On 2016년 12월 07일 12:05, Sebastian Reichel wrote:
> Hi Chanwoo,
> 
> On Tue, Dec 06, 2016 at 09:26:14AM +0900, Chanwoo Choi wrote:
>> Could you please review and pick the patch3/4 for power-supply driver?
> 
> Patches look fine. As I expect the merge window to open next week I
> would rather not queue this for 4.10 and instead do it once 4.10-rc1
> has been tagged.
> 
> -- Sebastian
> 

Thanks for your pick up.

-- 
Best Regards,
Chanwoo Choi
