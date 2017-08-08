Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:40557 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752068AbdHHKGN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2017 06:06:13 -0400
From: Vincent ABRIOU <vincent.abriou@st.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
CC: DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        "Boris Brezillon" <boris.brezillon@free-electrons.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        "David Airlie" <airlied@linux.ie>, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        "Kyungmin Park" <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        "Krzysztof Kozlowski" <krzk@kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Jyri Sarha <jsarha@ti.com>,
        =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        "Rongrong Zou" <zourongrong@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Eric Engestrom <eric@engestrom.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Rob Clark <robdclark@gmail.com>,
        Archit Taneja <architt@codeaurora.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 5/8] drm: Nuke drm_atomic_helper_plane_set_property
Date: Tue, 8 Aug 2017 10:03:00 +0000
Message-ID: <d7a0f3da-4254-a694-5975-db6fe395461f@st.com>
References: <20170725080122.20548-1-daniel.vetter@ffwll.ch>
 <20170725080122.20548-6-daniel.vetter@ffwll.ch>
In-Reply-To: <20170725080122.20548-6-daniel.vetter@ffwll.ch>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C696F6A28AF3C478DEE35A586A807CC@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DQoNCk9uIDA3LzI1LzIwMTcgMTA6MDEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IEl0J3Mg
ZGVhZCBjb2RlLCB0aGUgY29yZSBoYW5kbGVzIGFsbCB0aGlzIGRpcmVjdGx5IG5vdy4gVGhpcyBh
bHNvDQo+IGFsbG93cyB1cyB0byB1bmV4cG9ydCBkcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9zZXRf
cHJvcGVydHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4NCg0KWy4uLl0NCg0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2N1
cnNvci5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2dkcC5jICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdGkv
c3RpX2hxdmRwLmMgICAgICAgICAgICAgICAgIHwgIDEgLQ0KDQpBY2tlZC1ieTogVmluY2VudCBB
YnJpb3UgPHZpbmNlbnQuYWJyaW91QHN0LmNvbT4NCg0KQlINClZpbmNlbnQ=
