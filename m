Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"boris.brezillon@free-electrons.com"
	<boris.brezillon@free-electrons.com>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>,
	"dh.herrmann@gmail.com" <dh.herrmann@gmail.com>,
	"airlied@linux.ie" <airlied@linux.ie>
Subject: Re: [PATCH 0/4 v3] drm: Introduce drm_connector_register_all()
 helper
Date: Mon, 28 Mar 2016 10:36:50 +0000
Message-ID: <1459161409.4785.35.camel@synopsys.com>
References: <1458722577-20283-1-git-send-email-abrodkin@synopsys.com>
	 <20160323103752.GO28483@phenom.ffwll.local>
In-Reply-To: <20160323103752.GO28483@phenom.ffwll.local>
Content-Language: en-US
Content-Type: text/plain; charset="utf-7"
Content-ID: <77807CEA7612FC43BB3311784705A4B6@internal.synopsys.com>
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Wed, 2016-03-23 at 11:37 +-0100, Daniel Vetter wrote:
+AD4- On Wed, Mar 23, 2016 at 11:42:53AM +-0300, Alexey Brodkin wrote:
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
+AD4- +AD4- And one driver that uses unregister():
+AD4- +AD4- +AKAAWw-1+AF0- udl
+AD4- +AD4- 
+AD4- +AD4- Other drivers still use load() callback and so should be first modified so
+AD4- +AD4- their load() gets called from their probe() explicitly.
+AD4- +AD4- 
+AD4- +AD4- Build- and run-tested on yet to be upstreamed ARC PGU (part of AXS10x board).
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
+AD4- +AD4- Alexey Brodkin (4):
+AD4- +AD4- +AKA- drm: Rename drm+AF8-connector+AF8-unplug+AF8-all() to
+AD4- +AD4- +AKAAoACgAKA-drm+AF8-connector+AF8-unregister+AF8-all()
+AD4- +AD4- +AKA- drm: Introduce drm+AF8-connector+AF8-register+AF8-all() helper
+AD4- +AD4- +AKA- drm: atmel+AF8-hldc: Use generic drm+AF8-connector+AF8-register+AF8-all() helper
+AD4- +AD4- +AKA- drm: rcar-du: Use generic drm+AF8-connector+AF8-register+AF8-all() helper
+AD4- lgtm overall, but merge window is happening so don't want to throw 4.7
+AD4- patches into drm-misc. So will let these soak for a while more, please
+AD4- ping me after -rc1 is out that I don't forget them.

As you asked I'm pinging you with request to apply that series.

Also would be very nice if you take a look at that comment from
David Herrmann before application of that series:
http://article.gmane.org/gmane.comp.video.dri.devel/149708/match+AD0-re+-patch+-2+-4+-v3+-drm+-introduce+-drm+AF8-connector+AF8-register+AF8-al
l+-helper

-Alexey
