Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:56640 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728136AbeK3Di5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 22:38:57 -0500
Date: Thu, 29 Nov 2018 08:32:58 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH v6 3/6] m68k: coldfire: Add clk_get_optional() function
Message-ID: <20181129163258.GA26511@infradead.org>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-4-phil.edworthy@renesas.com>
 <bcb0278b-a4f5-068b-324f-7be3ca963102@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcb0278b-a4f5-068b-324f-7be3ca963102@linux-m68k.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 29, 2018 at 09:54:37PM +1000, Greg Ungerer wrote:
> Hi Phil,
> 
> On 17/11/18 12:59 am, Phil Edworthy wrote:
> > clk_get_optional() returns NULL if not found instead of -ENOENT,
> > otherwise the behaviour is the same as clk_get().
> > 
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Acked-by: Greg Ungerer <gerg@@linux-m68k.org>
> 
> Looks good. Do you want me to take this in the m68knommu git tree?
> Or is the whole series going through some other tree?

Any chance we could just get coldfire moved over to the common clock
framework?
