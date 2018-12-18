Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802E8C43612
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:55:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50FE92184A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 10:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="eoiF8iWE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbeLRKzb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 05:55:31 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:54051 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbeLRKza (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 05:55:30 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F23B625B75B;
        Tue, 18 Dec 2018 21:55:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545130528; bh=/7MuVuzROSeNLJ9f6Q2I72dMJ1Gn2+kDBYBwlat/D3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eoiF8iWEOwcv7IKnWLGolKR9Gy1qHa0YQ5xFJC0jqld5cm49x/OJldi3tczmuglrC
         uuSO0m/TKCyFKZ5EUj160bBpEElStrak496+LIi5pv7Ds0FZSjtFomQuAWUd6C77nC
         PnoKc48hHG4Txqx3xIeB59JZqiEBrKJIMCk2OPuc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 42ACD940274; Tue, 18 Dec 2018 11:55:26 +0100 (CET)
Date:   Tue, 18 Dec 2018 11:55:26 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 00/17] Add more support for the RZ/G2E
Message-ID: <20181218105525.ozv3vih7tawnmibc@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:23AM +0000, Fabrizio Castro wrote:
> Dear All,
> 
> this series adds more support to the RZ/G2E (a.k.a. r8a774c0)
> SoC specific device tree on top of what added from series
> (on which this series depends on):
> https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg36692.html
> 
> Thanks,
> Fab

Thanks, applied for v4.22.
