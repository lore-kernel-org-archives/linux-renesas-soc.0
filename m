Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33477 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757505AbcFAIc1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 04:32:27 -0400
Date: Wed, 1 Jun 2016 17:32:26 +0900
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC 0/4] ARM: dts: r8a7790: lager: use demuxer for I2C
Message-ID: <20160601083226.GA4163@verge.net.au>
References: <1464665528-11398-1-git-send-email-horms+renesas@verge.net.au>
 <CANqRtoTRRNQGk-gy1NrQhXNB0fzvkHDxwJGxyQHTYAgHUXm9ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANqRtoTRRNQGk-gy1NrQhXNB0fzvkHDxwJGxyQHTYAgHUXm9ZA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 01, 2016 at 12:17:29PM +0900, Magnus Damm wrote:
> Hi Simon,
> 
> On Tue, May 31, 2016 at 12:32 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > the intention of this series is to extend use of the demuxer for I2C
> > on the lager/r8a7790 to cover all I2C IP blocks.
> >
> > This is based on work by Wolfram Sang.
> >
> > I have not included GPIO in the demux configuration. This is in keeping
> > with the existing usage for IIC0/I2C0.
> 
> Thanks for your efforts! Can you please include GPIO support in next
> version? This way we should in the future be able to use
> distro-kernels out of the box that may only have GPIO bitbang support
> enabled.

Sure, will do.
