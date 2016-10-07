Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37700 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934989AbcJGDWB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 23:22:01 -0400
Date: Fri, 7 Oct 2016 12:21:56 +0900
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 09/11] DT: arm: shmobile: document SK-RZG1M board
Message-ID: <20161007032155.GL13721@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <1619405.o5fA0fLKdG@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619405.o5fA0fLKdG@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 06, 2016 at 12:45:18AM +0300, Sergei Shtylyov wrote:
> Document the SK-RZG1M device tree bindings, listing it as a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to the
> SK-RZG1M board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up as "ARM: shmobile: document SK-RZG1M board"
