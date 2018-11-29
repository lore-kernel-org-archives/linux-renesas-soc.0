Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35227 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbeK3BFl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 20:05:41 -0500
Date: Thu, 29 Nov 2018 15:00:10 +0100
From: Simon Horman <horms@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 07/22] ARM: dts: r8a7744: USB 2.0 host support
Message-ID: <20181129140010.l5vizmehfkdk7lvp@verge.net.au>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-8-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543319795-48325-8-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 27, 2018 at 11:56:20AM +0000, Biju Das wrote:
> Describe internal PCI bridge devices, USB phy device and
> link PCI USB devices to USB phy.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
