Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49179 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751018AbdGMIJB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 04:09:01 -0400
Date: Thu, 13 Jul 2017 10:08:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: r8a779[014]: Use R-Car Gen 2 fallback
 binding for vin nodes
Message-ID: <20170713080855.GK5580@verge.net.au>
References: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au>
 <20170713050744.GA23854@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170713050744.GA23854@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 07:07:44AM +0200, Niklas Söderlund wrote:
> Hi Simon,
> 
> Thanks for your work.
> 
> On 2017-07-11 14:56:46 +0200, Simon Horman wrote:
> > Use R-Car Gen 2 fallback binding for vind nodes in DT for r8a779[014] SoCs.
> > 
> > This has no run-time effect for the current driver as the initialisation
> > sequence is the same for the SoC-specific binding for r8a779[014] and the
> > fallback binding for R-Car Gen 2
> > 
> > This is consistent with existing compat string usage in vin nodes for the
> > r8a779[23] SoCs.
> 
> For whole serries:
> 
> Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks, applied for v4.14.
