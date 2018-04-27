Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-he1eur01on0138.outbound.protection.outlook.com ([104.47.0.138]:40386
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1757153AbeD0HhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 03:37:21 -0400
Subject: Re: [PATCH 00/24] device link, bridge supplier <-> drm device
To: Andrzej Hajda <a.hajda@samsung.com>, linux-kernel@vger.kernel.org
Cc: Archit Taneja <architt@codeaurora.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        Gustavo Padovan <gustavo@padovan.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        CK Hu <ck.hu@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <CGME20180426223215epcas2p38fe3b0b7b1ea1c8190805f9e2a89e11e@epcas2p3.samsung.com>
 <20180426223139.16740-1-peda@axentia.se>
 <25d8e621-b3f8-094f-32a2-d22efc2163a4@samsung.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <7d4bceeb-9611-cbf9-3906-fef5db88aad8@axentia.se>
Date: Fri, 27 Apr 2018 09:37:11 +0200
MIME-Version: 1.0
In-Reply-To: <25d8e621-b3f8-094f-32a2-d22efc2163a4@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-04-27 09:11, Andrzej Hajda wrote:
> Hi Peter,
> 
> On 27.04.2018 00:31, Peter Rosin wrote:
>> Hi!
>>
>> It was noted by Russel King [1] that bridges (not using components)
>> might disappear unexpectedly if the owner of the bridge was unbound.
>> Jyri Sarha had previously noted the same thing with panels [2]. Jyri
>> came up with using device links to resolve the panel issue, which
>> was also my (independent) reaction to the note from Russel.
>>
>> This series builds up to the addition of that link in the last
>> patch, but in my opinion the other 23 patches do have merit on their
>> own.
>>
>> The last patch needs testing, while the others look trivial. That
>> said, I might have missed some subtlety.
> 
> of_node is used as an identifier of the bridge in the kernel. If you
> replace it with device pointer there will be potential problem with
> devices having two or more bridges, how do you differentiate bridges if
> the owner is the same? If I remember correctly current bridge code does
> not allow to have multiple bridges in one device, but that should be
> quite easy to fix if necessary. After this change it will become more
> difficult.

I don't see how it will be more difficult?

> Anyway I remember discussion that in DT world bridge should be
> identified rather by of_graph port node, not by parent node as it is
> now. If you want to translate this relation to device owner, you should
> add also port number to have full identification of the bridge, ie pair
> (owner, port_number) would be equivalent of port node.

You even state the trivial solution here, just add the port/endpoint ID
when/if it is needed. So, what is the significant difference?

Cheers,
Peter
