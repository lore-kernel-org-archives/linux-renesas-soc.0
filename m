Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC77C65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 12:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D6C120645
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 12:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PgpVOvVX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6C120645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbeLMM4n (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 07:56:43 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:45156 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbeLMM4m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 07:56:42 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7F44925B781;
        Thu, 13 Dec 2018 23:56:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544705800; bh=vyJBOS2idZ5M5pAM7YllTZkwWNv17LFtOBEejuGDvjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PgpVOvVXs5DWGG32WVr0x4hZQSakVbZXo2cpLK2ERGlym0Bg5BlCl5ktD1zFsxz4T
         epX82FkYEeFzFQxuTt/vPx6F5NGl5bz8d4X3j6iKrlullUGzxqCT6kXFi/Jh+oEUn9
         U0AxPG5hrjyh7P5vMj7BrJsSmInuJnNedlvOEgR4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0E233940421; Thu, 13 Dec 2018 13:56:38 +0100 (CET)
Date:   Thu, 13 Dec 2018 13:56:38 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Olof Johansson <olof@lixom.net>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.21
Message-ID: <20181213125634.hx3uv5ymux2q6qxr@verge.net.au>
References: <cover.1544126077.git.horms+renesas@verge.net.au>
 <20181212214230.stbka7njol6qgvpj@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181212214230.stbka7njol6qgvpj@localhost>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 12, 2018 at 01:42:30PM -0800, Olof Johansson wrote:
> Hi Simon,
> 
> On Thu, Dec 06, 2018 at 01:57:02PM -0800, Simon Horman wrote:
> > Hi Olof, Hi Kevin, Hi Arnd,
> > 
> > Please consider these Renesas ARM64 based SoC defconfig updates for v4.21.
> > 
> > 
> > The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:
> > 
> >   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> > 
> > are available in the git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-defconfig-for-v4.21
> > 
> > for you to fetch changes up to fe16bcd6d44f1a2bccc4618119463d9d23a6ae92:
> > 
> >   arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE (2018-11-16 06:56:49 -0800)
> > 
> > ----------------------------------------------------------------
> > Renesas ARM64 Based SoC Defconfig Updates for v4.21
> > 
> > * Enable in arm64 defconfig:
> >   - Renesas R-Car Gen3 PCIe PHY driver
> >   - Renesas R-Car thermal driver
> >   - ASoC simple SCU sound card support
> > 
> > ----------------------------------------------------------------
> > Geert Uytterhoeven (1):
> >       arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
> > 
> > Simon Horman (2):
> >       arm64: defconfig: Enable R-Car thermal driver
> >       arm64: defconfig: Enable scu-simple-card driver
> 
> This patch enables the sound driver as a built-in. We normally try to keep all
> non-critical drivers (i.e. drivers not needed to reach a rootfs) as modules to
> avoid the defconfig kernel from bloating up too much.
> 
> Would you mind respinning this with the sound driver as a module instead?

Sure, will do.

> For PCIe I can see the argument that you might have rootfs on nvme or otherwise
> attached to that bus, so static there is fine.
> 
> 
> Thanks!
> 
> 
> -Olof
> 
