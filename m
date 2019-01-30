Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A9DC282D7
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EEEFA2184D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 10:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="NYHfa/r/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfA3KHB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 05:07:01 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39088 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfA3KHB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 05:07:01 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 43B9125B74E;
        Wed, 30 Jan 2019 21:06:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548842819; bh=l59vHhukIkLiSfvTpqTA8bKABmnb5WV14O9yOrmeowQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NYHfa/r/+eV3EnWK3dUNk9uF/hVftTBaJmJ1erjGumAgU+FX9M/j8O7YJVYIC6AwA
         1O5KhmeETC5XWQ4ou4Pkf9/cXcxum23piQcy9uxErrHww9JsYstbz77wSzG0gfF1+S
         XYVtGxYaSmzmaq9UuiodRk+LrlppAS33WH7BuBcU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 766C394043D; Wed, 30 Jan 2019 11:06:57 +0100 (CET)
Date:   Wed, 30 Jan 2019 11:06:57 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 2/7] sh_eth: RX checksum offload support
Message-ID: <20190130100656.kp6ff2zwxqs4xyzd@verge.net.au>
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <29cb4d33-37c3-43c0-3bce-fa01737c0fa4@cogentembedded.com>
 <20190128121855.t5w3us6kd7o6niph@verge.net.au>
 <d95fff4f-7750-87c4-3664-eb5efb593b75@cogentembedded.com>
 <20190129075810.rqeekk5j4npjh6wf@verge.net.au>
 <319141ef-caa5-2140-2920-c471dac086ea@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <319141ef-caa5-2140-2920-c471dac086ea@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 29, 2019 at 06:43:45PM +0300, Sergei Shtylyov wrote:
> On 01/29/2019 10:58 AM, Simon Horman wrote:
> 
> >>>> Add support for the RX checksum offload. This is enabled by default and
> >>>> may be disabled and re-enabled using 'ethtool':
> >>>>
> >>>> # ethtool -K eth0 rx {on|off}
> >>>>
> >>>> Some Ether MACs provide a simple checksumming scheme which appears to be
> >>>> completely compatible with CHECKSUM_COMPLETE: sum of all packet data after
> >>>> the L2 header is appended to packet data; this may be trivially read by
> >>>> the driver and used to update the skb accordingly. The same checksumming
> >>>> scheme is implemented in the EtherAVB MACs and now supported by tha 'ravb'
> >>>> driver.
> >>>>
> >>>> In terms of performance, throughput is close to gigabit line rate with the
> >>>> RX checksum offload both enabled and disabled.  The 'perf' output, however,
> >>>> appears to indicate that significantly less time is spent in do_csum() --
> >>>> this is as expected.
> >>>
> >>> Nice.
> >>>
> >>> FYI, this seems similar to what I observed for RAVB, perhaps on H3 I don't
> >>> exactly recall. On E3, which has less CPU power, I recently observed that
> >>> with rx-csum enabled I can achieve gigabit line rate, but with rx-csum
> >>> disabled throughput is significantly lower. I.e. on that system throughput
> >>> is CPU bound with 1500 byte packets unless rx-csum enabled.
> >>
> >>    Unfortunately, we can't teset these patches on the other gen3 boards. ISTR
> >> you have RZ/A1H board... if it's still with you, I'd appreciate testing.
> > 
> > Unfortunately, as of a few weeks ago, I no longer have that board.
> > 
> >>> Next point:
> >>>
> >>> 2da64300fbc ("ravb: expand rx descriptor data to accommodate hw checksum")
> >>> is fresh in my mind and I wonder if mdp->rx_buf_sz needs to grow to ensure
> >>> that there is always enough space for the csum.
> >>
> >>    Well, if you look at sh_eth_ring_init(), you'll see that the driver reserves
> >> plenty of space at the end the RX buffers.
> > 
> > Yes, I see that. And I assume that was enough space before this patch.
> > But is it still enough space now that 2 bytes are needed for the hardware csum?
> 
>   To quote the source:
> 
> 	/* +26 gets the maximum ethernet encapsulation, +7 & ~7 because the
> 	 * card needs room to do 8 byte alignment, +2 so we can reserve
> 	 * the first 2 bytes, and +16 gets room for the status word from the
> 	 * card.
> 	 */
> 	mdp->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ :
> 			  (((ndev->mtu + 26 + 7) & ~7) + 2 + 16));
> 
>    I have no idea what they mean by status word and why it takes 16 bytes (and I even
> have the R8A771x manual!) but I think these 16 bytes are where our checksum goes...
> that's why I said there's plenty of space. :-)

Ok. FWIIW, I don't know either.

> > 2 bytes that might have previously been used as packet data in some
> > circumstances.
> > 
> >>> In particular, have you
> >>> tested this with MTU-size frames with VLANs. (My test is to run iperf3 over
> >>> a VLAN netdev, netperf over a VLAN netdev would likely work just as well.)
> >>
> >>    Could you refresh me on how to bring up a VLAN on a given interface?
> > 
> > You will need a kernel with CONFIG_VLAN_8021Q enabled.
> > 
> > Then you can do something like this:
> > 
> > 	ip link add link eth0 name eth0.1 type vlan id 1
> > 	ip addr add 10.1.1.100/24 dev eth0.1
> > 	ip link set dev eth0.1 up
> 
>   Thank you! I'm not familiar with 'ip' at all, thought 'ifconfig' could do the same
> thing easier but couldn't remember all the needed incantations... :-)
>    Anyway, it worked!
> 
> >> [...]
> >>>> The above results collected on the R-Car V3H Starter Kit board.
> >>>>
> >>>> Based on the commit 4d86d3818627 ("ravb: RX checksum offload")...
> >>>>
> >>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >> [...]
> 
> MBR, Sergei
> 
