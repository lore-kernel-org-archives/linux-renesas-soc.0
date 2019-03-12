Return-Path: <SRS0=vwGd=RP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04065C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 00:35:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1A8C2087F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Mar 2019 00:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="zjFXJ/iw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbfCLAfN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 20:35:13 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:41731 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfCLAfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 20:35:13 -0400
Received: by mail-lf1-f43.google.com with SMTP id 10so685869lfr.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Mar 2019 17:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Jwwu/na7SDY1G3CQWl0NbLLpX6UJvn4AASNgJoWFfqA=;
        b=zjFXJ/iwKHBbKfUAbaUyswEZfIDgRn8Vo2GUv3SCeKBbylRsG35E1FbAxEHZ76wayQ
         khEhZ6vgmM0tXCqEv5tGB43uc0nRTIcl5kjHfkzlk4kic3yYA3ILoKpYcP9tNdN6O+O8
         zFn6iIqRfk77k8YrPS9aO8MM+tvRG2b+rEqSmwrGTSvcq64RaZJTq8ezzQ9m4YUmpIww
         OnRr6ZRRWp3LvlnkHuAoZdbIzMa+YZaGTLGQ4YXmbjtWVqy96vhjEa7Hh6u6LVHHx143
         Gxq+8+Y64KmCAkPVg4txx85e21uu8mL+xirJUQO+iAl3iJ4JiZVYoMuFO5H7KxH4Op4T
         vOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Jwwu/na7SDY1G3CQWl0NbLLpX6UJvn4AASNgJoWFfqA=;
        b=IqlfN8ma663+kl74at30wug+B0S+U28xn71YoWX1hbZ/f81DGOepmPhwZfS4sMQwjV
         YGXzQebRnD76HmPyRoY3CB2JN9KIsNmNmG0m2VycHJwbCuKvVBdU7sdUzk5DwR4WBNjl
         vY7c9bI0B2oHzeK9zjjMucgt/PZhiY7pw0KZH4vLy05YHTxAWa0Oy+xUUp+o70RxgMLq
         mozbmNaZSBMbwkGgAR+rHMOBtO3rKKOsjjxcd1uJFflGZbBTSjF06IaDwHDE9OnnE8ck
         td4Gv39Txp2pSNCaCYC9p86QxeXzqw++wMAgV5xYJ181C9Cak3MQiT/VCeZbwjkIo0q6
         4ZSA==
X-Gm-Message-State: APjAAAWlC/QtOk8FCTST54ct7zMPKyclxl2MwrS1W2T+8TBHWyy5X3/D
        J399arBGGyMJN+sI07QJk2vD/g==
X-Google-Smtp-Source: APXvYqxzfPbP6WBUI3OKOOiBNpjwO9CAk9NqR2PudIJ7OqEYoqKBbQ07rWQ8Jca+G1cr1okRwRmaSA==
X-Received: by 2002:a19:550d:: with SMTP id n13mr1559251lfe.50.1552350910967;
        Mon, 11 Mar 2019 17:35:10 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id t24sm1309019lfb.33.2019.03.11.17.35.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Mar 2019 17:35:10 -0700 (PDT)
Date:   Tue, 12 Mar 2019 01:35:09 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] rcar-csi2: Propagate the FLD signal for NTSC and PAL
Message-ID: <20190312003509.GJ5281@bigcity.dyn.berto.se>
References: <20190308235157.26357-1-niklas.soderlund+renesas@ragnatech.se>
 <20190311090901.GG4775@pendragon.ideasonboard.com>
 <20190311214559.GI5281@bigcity.dyn.berto.se>
 <20190311221023.GA12319@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190311221023.GA12319@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 2019-03-12 00:10:23 +0200, Laurent Pinchart wrote:
> > >> +		fld =  FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2 | 
> > >> FLD_FLD_EN;
> > >> +
> > >> +		if (priv->mf.height == 240)
> > >> +			fld |= FLD_FLD_NUM(2);
> > >> +		else
> > >> +			fld |= FLD_FLD_NUM(1);
> > > 
> > > How does this work ? Looking at the datasheet, I was expecting
> > > FLD_DET_SEL field to be set to 01 in order for the field signal to
> > > toggle every frame.
> > 
> > I thought so too then I read 26.4.5 FLD Signal which fits what is done 
> > in the BSP code and fits with how the hardware behaves.
> 
> Do we have a guarantee that all alternate sources will cycle the frame
> number between 1 and 2 ? If not I think you should select based on the
> LSB.
> 

I can't imagine we have such guarantees and experimenting with 
FLD_DET_SEL set to 01 one works as expected. I will do so in next 
version. Thanks for finding this.

-- 
Regards,
Niklas Söderlund
