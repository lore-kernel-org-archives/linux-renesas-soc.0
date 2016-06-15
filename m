Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47958 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741AbcFOEI0 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 00:08:26 -0400
Date: Wed, 15 Jun 2016 13:08:23 +0900
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 1/4] ARM: dts: r8a7790: lager: rename i2cexio as
 i2cexio0
Message-ID: <20160615040823.GA29110@verge.net.au>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <1465370066-8450-2-git-send-email-horms+renesas@verge.net.au>
 <20160608080340.GH1521@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160608080340.GH1521@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 08, 2016 at 10:03:40AM +0200, Wolfram Sang wrote:
> On Wed, Jun 08, 2016 at 04:14:23PM +0900, Simon Horman wrote:
> > This is in preparation for adding i2cexio1 which will use the
> > dmuxer for IIC1/I2C0.
> 
> I2C1

Thanks, I will fix that.
