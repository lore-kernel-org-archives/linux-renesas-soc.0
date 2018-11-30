Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36837 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725749AbeLALHr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Dec 2018 06:07:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so6486344ljk.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Nov 2018 15:56:43 -0800 (PST)
Date: Fri, 30 Nov 2018 15:06:04 -0800
From: Olof Johansson <olof@lixom.net>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.21
Message-ID: <20181130230604.4wpje3qfal2lkqwx@localhost>
References: <cover.1543229515.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1543229515.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 26, 2018 at 01:55:01PM +0100, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT updates for v4.21.
> 
> I am sending out this pull-request at this time as there are a number
> of patches queued up in my arm64 DT branch and I hope that this
> will ease the burden later on in the development cycle. I expect to
> send a follow-up pull-request for this branch at the usual pre-rc6 timing.
> 
> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> 
>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v4.21
> 
> for you to fetch changes up to 275e4eb3f21a09b6b8bd4a353b9a01e500240385:
> 
>   arm64: dts: renesas: Add all CPUs in cooling maps (2018-11-26 09:11:44 +0100)
> 
> ----------------------------------------------------------------
> Renesas ARM64 Based SoC DT Updates for v4.21
> 
> * H3 (r8a7795) SoC:
>   - Remove unneeded sound #address/size-cells
> 
> * M3-W (r8a7796) SoC:
>   - Describe CMT (Compare Match Timer) devices in DT
>   - Describe I2C-DVFS device node in DT
> 
> * M3-N (r8a77965) SoC:
>   - Describe CAN, CANFD and LVDS in DT
> 
> * R-Car H3 (r8a7795) and M3-W (r8a7796) SoCs:
>   - Describe CPU topology, capacity and cooling maps in DT
>   - Add SSIU support to R-Car audio
> 
> * R-Car H3 (r8a7795), M3-W (r8a7796) and M3-N (r8a77965) SoCs:
>   - Extend register range of HSUSB device to match documentation
> 
> * R-Car H3 (r8a7795), M3-W (r8a7796) and M3-N (r8a77965) based
>   Salvator-X, Salvator-XS and ULCB boards:
>   - Switch eMMC bus to 1V8
> 
> * R-Car H3 (r8a7795), M3-W (r8a7796) and M3-N (r8a77965) based
>   Salvator-X and Salvator-XS boards:
>   - Describe USB3.0 xHCI host and prerepheral devices as companions
> 
> * R-Car E3 (r8a77990) SoC:
>   - Add thermal support
>   - Add support for interupt controller for external devices (INTC-EX)
>   - Describe all SCIF devices and SYS-DMA for I2C and MSIOF devices
> 
> * R-Car E3 (r8a77990) based Ebisu board:
>   - Enable SDHI, CAN, CANFD, audio and USB3.0
>   - Describe serial console pins
> 
> * R-Car E3 (r8a77990) based Ebisu and
>   R-Car D3 (r8a77995) based Draak board:
>   - Enable USB2.0 peripheral device
> 
> * R-Car M3-N (r8a77965), E3 (r8a77990) and V3H (r8a77980) SoCs:
>   - Connect EtherAVB to IPMMU
> 
> * R-Car V3M (r8a77970) and V3H (r8a77980) SoCs:
>   - Describe TMU (timer unit), PWM timer controller and MSIOF devides in DT
>   - Add thermal support
> 
> * RZ/G2M (r8a774a1) SoC:
>   - Use clock and power index macros
>   - Describe VIN, CSI-2 and CAN devices in DT


Merged, thanks!


-Olof
