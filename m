Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:35434 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751272AbeEBMj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 08:39:27 -0400
Date: Wed, 2 May 2018 05:39:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Christoph Hellwig <hch@infradead.org>, ysato@users.sourceforge.jp,
        dalias@libc.org, thomas.petazzoni@free-electrons.com,
        robin.murphy@arm.com, geert@linux-m68k.org,
        sergei.shtylyov@cogentembedded.com,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] sh: mm: Fix unprotected access to struct device
Message-ID: <20180502123909.GA9546@infradead.org>
References: <1524044555-20610-1-git-send-email-jacopo+renesas@jmondi.org>
 <20180502074600.GC27261@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180502074600.GC27261@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 02, 2018 at 09:46:31AM +0200, jacopo mondi wrote:
> Hi again Christoph,
> 
>     The gentle ping actually applies to this version of the patch.
> 
> Sorry for the confusion.

I'd expect this to go in through the sh tree, but if the sh maintainers
are fine with it I can take it through the dma-mapping tree.
