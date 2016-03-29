Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "boris.brezillon@free-electrons.com"
	<boris.brezillon@free-electrons.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"dh.herrmann@gmail.com" <dh.herrmann@gmail.com>
Subject: Re: [PATCH 0/3 v5] drm: Introduce drm_connector_register_all()
 helper
Date: Tue, 29 Mar 2016 12:46:41 +0000
Message-ID: <1459255601.3021.37.camel@synopsys.com>
References: <1459246972-9860-1-git-send-email-abrodkin@synopsys.com>
	 <20160329144334.258c4ba7@bbrezillon>
In-Reply-To: <20160329144334.258c4ba7@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="utf-7"
Content-ID: <FC047FE6B2ACDE4D87F32BAD1167F037@internal.synopsys.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Boris,

On Tue, 2016-03-29 at 14:43 +-0200, Boris Brezillon wrote:
+AD4- Hi Alexey,
+AD4- 
+AD4- On Tue, 29 Mar 2016 13:22:49 +-0300
+AD4- Alexey Brodkin +ADw-Alexey.Brodkin+AEA-synopsys.com+AD4- wrote:
+AD4- 
+AD4- +AD4- 
+AD4- +AD4- As a pair to already existing drm+AF8-connector+AF8-unplug+AF8-all()
+AD4- +AD4- (which we'll rename in this series to drm+AF8-connector+AF8-unregister+AF8-all())
+AD4- +AD4- we're adding generic implementation of what is already done in some drivers
+AD4- +AD4- for registering all connectors.
+AD4- +AD4- 
+AD4- +AD4- After implementation of that new helper we're updating 2 drivers
+AD4- +AD4- that used to use it's own implementation:
+AD4- +AD4- +AKAAWw-1+AF0- atmel+AF8-hlcdc
+AD4- +AD4- +AKAAWw-2+AF0- rcar+AF8-du
+AD4- +AD4- 
+AD4- +AD4- Other drivers still use load() callback and so should be first modified so
+AD4- +AD4- their load() gets called from their probe() explicitly.
+AD4- +AD4- 
+AD4- +AD4- Build- and run-tested on yet to be upstreamed ARC PGU (part of AXS10x board).
+AD4- +AD4- 
+AD4- +AD4- Changes v4 -+AD4- v5:
+AD4- +AD4- +AKAAKg- Added missing mutex unlock on a fail path in drm+AF8-connector+AF8-register+AF8-all()
+AD4- +AD4- +AKAAoACg-Thanks David for his attention and patience+ACE-
+AD4- +AD4- 
+AD4- +AD4- Changes v3 -+AD4- v4:
+AD4- +AD4- +AKAAKg- Based on current drm-intel/topic/drm-misc
+AD4- +AD4- +AKAAoACg-It's now on commit 6c87e5c3ec6db052f3744804a517b6fb003906e1
+AD4- +AD4- +AKAAoACg-And since thet new base already has
+AD4- +AD4- +AKAAoACgACI-drm: Rename drm+AF8-connector+AF8-unplug+AF8-all() to drm+AF8-connector+AF8-unregister+AF8-all()+ACI-
+AD4- +AD4- +AKAAoACg-this series now only includes 3 subsequent patches.
+AD4- +AD4- 
+AD4- +AD4- +AKAAKg- In drm+AF8-connector+AF8-register+AF8-all() fail path which calls unregister+AF8-all()
+AD4- +AD4- +AKAAoACg-is moved outside of loop+ACY-locked section (as suggested by Daniel)
+AD4- +AD4- 
+AD4- +AD4- Changes v2 -+AD4- v3:
+AD4- +AD4- +AKAAKg- Added acks for 1, 3 and 4 patches
+AD4- +AD4- +AKAAKg- Updated kerneldoc descriptins of both register+AF8- and unregister+AF8-all()
+AD4- +AD4- +AKAAKg- Updated commit messages (mostly spellos and grammar issues)
+AD4- +AD4- 
+AD4- +AD4- Changes v1 -+AD4- v2:
+AD4- +AD4- +AKAAKg- Rename drm+AF8-connector+AF8-unplug+AF8-all() to drm+AF8-connector+AF8-unregister+AF8-all()
+AD4- +AD4- +AKAAKg- Use drm+AF8-for+AF8-each+AF8-connector() instead of list+AF8-for+AF8-each+AF8-entry()
+AD4- +AD4- +AKAAKg- Updated kerneldoc for drm+AF8-dev+AF8-register()
+AD4- +AD4- 
+AD4- +AD4- Cc: Daniel Vetter +ADw-daniel+AEA-ffwll.ch+AD4-
+AD4- +AD4- Cc: David Airlie +ADw-airlied+AEA-linux.ie+AD4-
+AD4- +AD4- Cc: Boris Brezillon +ADw-boris.brezillon+AEA-free-electrons.com+AD4-
+AD4- Next time, can you please send all the patches of the series, not
+AD4- only the cover letter.

Sure.

It would be so much more convenient if git may add all people mentioned
in any patch of series to Cc list for all other patches (+- cover letter).
Without that feature one has to add all people in Cc explicitly in each patch.

-Alexey
