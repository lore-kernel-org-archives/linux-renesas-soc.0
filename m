Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 25 Mar 2016 11:09:51 +0900
From: Simon Horman <horms@verge.net.au>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] phy: rcar-gen2, rcar-gen3-usb2: add fallback
 binding
Message-ID: <20160325020948.GB31681@verge.net.au>
References: <1457315921-30217-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457315921-30217-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 07, 2016 at 10:58:39AM +0900, Simon Horman wrote:
> Add fallback compatibility strings for rcar phy drivers.
> 
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 2 and Gen 3. But beyond that its not clear what the
> relationship between IP blocks might be. For example, I believe that
> r8a7790 is older than r8a7791 but that doesn't imply that the latter is a
> descendant of the former or vice versa.
> 
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
> 
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.

Hi Kishon,

I am wondering if you could consider applying this series.

Thanks!

> 
> Changes in v3:
> * Added Acks
> * Corrected whitespace in examples
> 
> Changes in v2:
> * Update new compatibility strings to match the preferred scheme for
>   ordering elements
> * Rebase
> 
> Simon Horman (2):
>   phy: rcar-gen2: add fallback binding
>   phy: rcar-gen3-usb2: add fallback binding
> 
>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt      |  8 +++++++-
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++++--
>  drivers/phy/phy-rcar-gen2.c                                  |  1 +
>  drivers/phy/phy-rcar-gen3-usb2.c                             |  1 +
>  4 files changed, 17 insertions(+), 3 deletions(-)
> 
> -- 
> 2.1.4
> 
