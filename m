Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36103 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbeK3CEF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 21:04:05 -0500
Date: Thu, 29 Nov 2018 15:58:24 +0100
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 12/22] ARM: dts: r8a7744-iwg20d-q7-dbcm-ca: Add device
 tree for camera DB
Message-ID: <20181129145823.3ny6pyospglbgqsb@verge.net.au>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-13-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543319795-48325-13-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 27, 2018 at 11:56:25AM +0000, Biju Das wrote:
> This patch adds support for the camera daughter board which is
> connected to iWave's RZ/G1N Qseven carrier board.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
