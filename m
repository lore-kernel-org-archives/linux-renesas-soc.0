Return-Path: <SRS0=y581=S7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE89BC43219
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 29 Apr 2019 09:31:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2764E2075E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 29 Apr 2019 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556530260;
	bh=VO7Rb4W3ogbvtrPaSlbogEaUH6r/2rtnFPYsqHdsg3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zmFmfQ4tAvNGntBSIb9CZIGfysoE7tB/537byyGldHNSlTSNiA5syRy4Ihy+xB60k
	 A+uh6EIcnicrmO8wOcgfDIAPAzv/piDRokyjHHFlCjlNvu9rXziADX7BVmS6MmdLeg
	 Z0WrM/z6vmCxyHzIUQhSgJXa8Ve7W3kt90aUKlEU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfD2Ja7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 29 Apr 2019 05:30:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:50240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727259AbfD2Ja7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:30:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D6BE206BF;
        Mon, 29 Apr 2019 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556530259;
        bh=VO7Rb4W3ogbvtrPaSlbogEaUH6r/2rtnFPYsqHdsg3Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2KTt+cb/EwBIgKOgpGvZWIWog1sv563ZGuMl65pg2PSZAKQvdJ58Wbs4HUAvaVdSX
         SNTYt0R/m55Q8Fq5ePAFehj3YUoKuqEQ65PVDaLYnz/hlktVtFibZB8YosEnZz6Eny
         zE5NinJMZJ0jHDBUtYh+iizrYjSlCaQv+GbqF2JM=
Date:   Mon, 29 Apr 2019 11:30:56 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V5 06/13] dt-bindings: usb: renesas_usbhs: Add support
 for r8a77470
Message-ID: <20190429093056.GA11049@kroah.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
 <1554907730-14792-7-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB2103DD45B93A448E2C8C6911B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103DD45B93A448E2C8C6911B8390@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 09:16:01AM +0000, Biju Das wrote:
> Hi Greg,
> 
> Does this patch looks ok to you? 

Sure, but as it was never sent to me, why would you ask me?  :)

