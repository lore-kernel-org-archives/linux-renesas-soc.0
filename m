Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42111 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbeLDNhT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Dec 2018 08:37:19 -0500
Date: Tue, 4 Dec 2018 05:37:14 -0800
From: Simon Horman <horms@verge.net.au>
To: Olof Johansson <olof@lixom.net>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL v2] Renesas ARM Based SoC DT Updates for v4.21
Message-ID: <20181204133710.quietvso7c7bblbv@verge.net.au>
References: <cover.1543409901.git.horms+renesas@verge.net.au>
 <20181130230826.5kjtfyq2wdr73iwl@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181130230826.5kjtfyq2wdr73iwl@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 30, 2018 at 03:08:26PM -0800, Olof Johansson wrote:
> On Wed, Nov 28, 2018 at 02:02:12PM +0100, Simon Horman wrote:
> > Hi Olof, Hi Kevin, Hi Arnd,
> > 
> > Please consider these Renesas ARM based SoC DT updates for v4.21.
> > 
> > I am sending out this pull-request at this time as there are a number
> > of patches queued up in my arm (32) DT branch and I hope that this
> > will ease the burden later on in the development cycle. I expect to
> > send a follow-up pull-request for this branch at the usual pre-rc6 timing.
> > 
> > Changes since v1:
> > * Correct garbled Reviewed-by tag in
> >   "[PATCH 01/16] ARM: dts: r9a06g032: Add pinctrl node"
> > 
> > The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> > 
> >   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> > 
> > are available in the git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt-for-v4.21
> > 
> > for you to fetch changes up to 673df60a880f060e3e94920c7b5f7a9ed8aa65f2:
> >   ARM: dts: r9a06g032: Correct the GIC DT node name (2018-11-28 13:55:30 +0100)
> > 
> > ----------------------------------------------------------------
> > Renesas ARM Based SoC DT Updates for v4.21
> > 
> > * RZ/N1D (r9a06g032) SoC:
> >   - Correct GIC DT node name
> >   - Enable pin controller
> > 
> > * RZ/G1C (r8a77470) iWave g23S single board computer
> >   - Add QSPI flash support
> >   - Add pinctl support for EtherAVB
> >   - Enable CMT0 (Renesas R-Car Compare Match Timer)
> >   - Enable RWDT (Renesas Watchdog Timer)
> >   - Enable uSD and eMMC support
> > 
> > * RZ/G1C (r8a77470) SoC:
> >   - Describe USB-DMAC and I2C devices in DT
> > 
> > * R-Mobile A1 (r8a7740), Emma Mobile EV2 (emev2) and
> >   SH-Mobile AG5 (sh72a0) SoCs:
> >   - Include SoC name in DTSI
> > 
> > * R-Car H2 (r8a7790) based lager, and
> >   R-Car M2-W (r8a7791) based koelsch and porter boards:
> >   - Disable unconnected LVDS encoders
> 
> Hi,
> 
> If you revise a previous pull request, please do it as a new tag (and
> delete the old one so our pull will fail), or at least please reply to
> it so I see a "please don't pull this, I've respun a v2" threaded reply.
> 
> No harm done in this case, since you rewrote with the previous tag,
> but it made me scratch my head when I saw the previous one and the hash
> didn't match the email. ;)

Thanks Olof,

next time I'll create a new tag.
