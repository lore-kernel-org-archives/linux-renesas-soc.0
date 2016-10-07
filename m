Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39425 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751608AbcJGFzO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2016 01:55:14 -0400
Date: Fri, 7 Oct 2016 14:55:11 +0900
From: Simon Horman <horms@verge.net.au>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: HDMI No signal in koelsche Board
Message-ID: <20161007055511.GD5855@verge.net.au>
References: <SG2PR0401MB12966A4306847C677EA70FCDD8C60@SG2PR0401MB1296.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR0401MB12966A4306847C677EA70FCDD8C60@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 07, 2016 at 05:46:34AM +0000, Jithin T Raj wrote:
> hi simmon,
>     
> 
>  I doesn't checked that yet but now  I am cloning   " git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-for-v4.1"   I think it will solve for me right?

I'm unsure what problem you are trying to solve but that is a pretty
obscure branch containing (only) DT changes for Renesas ARM-SoCs that
were included in v4.1.

Please try v4.8. Or if you want something with development code
the devel branch of the renesas tree above (which includes v4.8).
