Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47997 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741AbcFOENB (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 00:13:01 -0400
Date: Wed, 15 Jun 2016 13:12:57 +0900
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/4] ARM: dts: r8a7790: lager: use demuxer for
 IIC1/I2C1
Message-ID: <20160615041257.GB29110@verge.net.au>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <1465370066-8450-3-git-send-email-horms+renesas@verge.net.au>
 <20160613143304.GC1603@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160613143304.GC1603@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 13, 2016 at 04:33:04PM +0200, Wolfram Sang wrote:
> On Wed, Jun 08, 2016 at 04:14:24PM +0900, Simon Horman wrote:
> > Make it possible to select which I2C1 IP core you want to run on the
> > EXIO-A connector.
> > 
> > This is based on reference work for the I2C0 core of the lager by Wolfram Sang.
> > 
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Given the PFC problem gets solved, why can't you switch to GP1_16 and
> GP1_17 for those?

Thanks, I missed that. I will see about making it so.
