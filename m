Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ve1eur01on0134.outbound.protection.outlook.com ([104.47.1.134]:48948
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755174AbeD3VNG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 17:13:06 -0400
Subject: Re: [PATCH 24/24] drm/bridge: establish a link between the bridge
 supplier and consumer
To: linux-kernel@vger.kernel.org,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-samsung-soc@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Peter Senna Tschudin <peter.senna@collabora.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vincent Abriou <vincent.abriou@st.com>,
        linux-arm-kernel@lists.infradead.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org
References: <20180426223139.16740-1-peda@axentia.se>
 <20180426223139.16740-25-peda@axentia.se>
 <20180430153236.GP12521@phenom.ffwll.local>
From: Peter Rosin <peda@axentia.se>
Message-ID: <e2562f6f-f7b0-477c-db38-a3bf6c956fa7@axentia.se>
Date: Mon, 30 Apr 2018 23:12:56 +0200
MIME-Version: 1.0
In-Reply-To: <20180430153236.GP12521@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-04-30 17:32, Daniel Vetter wrote:
> On Fri, Apr 27, 2018 at 12:31:39AM +0200, Peter Rosin wrote:
>> If the bridge supplier is unbound, this will bring the bridge consumer
>> down along with the bridge. Thus, there will no longer linger any
>> dangling pointers from the bridge consumer (the drm_device) to some
>> non-existent bridge supplier.
>>
>> Signed-off-by: Peter Rosin <peda@axentia.se>
> 
> Minus the ->owner bikeshed I brought up in the previous patch I agree with
> this approach as the best way to move forward for now.
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks, let's see if Laurent is also on-board...

> One small suggestion below, for merging I'd say pls get Jyri's
> review/tested-by too, since you're both working on the same problem it
> seems.

Yes, I too would be very happy to see a tested-by from someone.

> Aside: Do you want commit rights to drm-misc to be able to push work like
> this?

If that makes life easier, sure.

Cheers,
Peter
