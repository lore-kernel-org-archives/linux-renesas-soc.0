Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:38760 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932973AbdC3KsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2017 06:48:24 -0400
Message-ID: <1490870898.3471.3.camel@collabora.co.uk>
Subject: Re: [PATCH/RFC v2 0/2] arm64: dts: r8a7795: Add support for R-Car
 H3 ES2.0
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date: Thu, 30 Mar 2017 12:48:18 +0200
In-Reply-To: <1490362665-4422-1-git-send-email-geert+renesas@glider.be>
References: <1490362665-4422-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, 2017-03-24 at 14:37 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds preliminary support for Renesas Salvator-X
> development boards equipped with revision ES2.0 of the R-Car H3 Soc.
> 
>   - Patch 1 adds support for the R-Car H3 ES2.0 Soc,
>     While this patch is safe as-is, as it doesn't affect any existing
>     setups, it's probably a bit premature to apply it.
>   - Patch 2 adds support for Salvator-X boards with R-Car H3 ES2.0.
>     This patch does affect existing development setups, as it changes
> the
>     name of the DTB for Salvator-X boards equipped with ES1.x SoCs.
>     Given most developers have access to ES1.x only, this patch must
> not be
>     applied yet.

Would it make more sense to add a new r8a7795-es2.dtsi and keep the
current dtsi for es1? Having to load different device-trees based on
which kernel is used would be rather nasty.

-- 
Sjoerd Simons
Collabora Ltd.
