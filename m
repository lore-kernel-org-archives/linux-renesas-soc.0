Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:57700 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbeINS1D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:27:03 -0400
Date: Fri, 14 Sep 2018 15:12:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        linux-renesas-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] dma-mapping: clear dma_parms on teardown, too
Message-ID: <20180914131240.GB27141@lst.de>
References: <20180913151716.6333-1-wsa+renesas@sang-engineering.com> <20180913151716.6333-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180913151716.6333-4-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Same here.  I don't even think we really need to clear the ops to
start with, but we if we want to do it I'd just do it directly in
the two callers.
