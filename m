Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52493 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752813AbdJFJZ2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 05:25:28 -0400
Date: Fri, 6 Oct 2017 11:25:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: dts: rcar-gen2: Use generic node name for VSP1
 nodes
Message-ID: <20171006092523.GG7734@verge.net.au>
References: <1507120609-14501-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507120609-14501-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 04, 2017 at 02:36:45PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus, Laurent,
> 
> This patch series replaces the specific node names used for the VSP1
> nodes by the preferred generic node names, cfr. commit 0e1bfb72b076b07d
> ("v4l: vsp1: Use generic node name").
> 
> Thanks!
> 
> Geert Uytterhoeven (4):
>   ARM: dts: r8a7790: Use generic node name for VSP1 nodes
>   ARM: dts: r8a7791: Use generic node name for VSP1 nodes
>   ARM: dts: r8a7792: Use generic node name for VSP1 nodes
>   ARM: dts: r8a7794: Use generic node name for VSP1 nodes

Thanks, applied.
