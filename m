Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48115 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750849AbcFOE3r (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 15 Jun 2016 00:29:47 -0400
Date: Wed, 15 Jun 2016 13:29:43 +0900
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: r8a7790: lager: use demuxer for
 IIC3/I2C3
Message-ID: <20160615042943.GC29110@verge.net.au>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
 <1465370066-8450-5-git-send-email-horms+renesas@verge.net.au>
 <20160613143521.GD1603@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160613143521.GD1603@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 13, 2016 at 04:35:21PM +0200, Wolfram Sang wrote:
> 
> >  		i2c9 = "i2cexio1";
> >  		i2c10 = "i2chdmi";
> >  		i2c11 = "gpioi2c";
> > +		i2c12 = "i2cpwr";
> 
> To make it easier for users, we should maybe group them?
> 
> i2c8+9: additional gpio busses
> i2c10-13: i2cexioX

Should we also group gpioi2cX?
