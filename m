Return-Path: <SRS0=bqQk=O5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763C1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48F6A218F0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 20 Dec 2018 20:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545338490;
	bh=3nBF/WfE1dyPy/p9NnJp0jwuOvr2eMVLtk+vD9v7iYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=m7K0Gjp4vAEeLvd1vsn6WUf3bqDNPPiXUsUZjCKbSHXwsG2EP+nIKifAYEu4VZr8K
	 CJ1hLsg8SpTCxUG2vv22NURFRLu3L0+isiMDAsvOwZ72sydf/0mKXM3W5GNVrprHlD
	 tUVpqjq3IF23rqMlakgowbCTbvYtG94ZlCqPInVw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733235AbeLTUl3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 20 Dec 2018 15:41:29 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36186 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731883AbeLTUl3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Dec 2018 15:41:29 -0500
Received: by mail-oi1-f194.google.com with SMTP id x23so3025895oix.3;
        Thu, 20 Dec 2018 12:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lqk+qE2ZTxBI9cpf9v/Lzk9aJer3vWRArL0RtMsR/UE=;
        b=ay0dnjNQWiHIq7Eg0LG6lFa/g3H/Z3JhxXlMVd30JvfMyOXvjNgHK+3mdS6Gex7x5Y
         4osKvhywecUh0LY8XKUJGgc2itruJ3GMi7cTrZv6Fv9i4uZKTuNrpadVI7qqbQWoXM9D
         DeAZ2woonO5nJOjLm6++3AegiQI3CmYoTQUgebPOGaR6EyELRwdyp5h9b1dBOudFmdQm
         xLnjsOTtatkmUMEhvkJb/BZ54odLYrKZUB5S9q26JQK/uGgoxMuE5L/5DzUu9FWvsQyV
         fHBRCfAwo43KtK0xD9OO7KOtsW/XDxY+a8Xmf/K4KZF+y1FhBq1MOP9WDlEVfuvSQhQ0
         AgNw==
X-Gm-Message-State: AA+aEWZN/8g3283VNxv245+xzMlCbUNkU0awxq8wnzfZ1lmPogXPPfPr
        N5N+0Z9GzwoyIi7LZo2RcA==
X-Google-Smtp-Source: ALg8bN6mYdzUo+yiESk/TqePv5SkUOlbDK6V329E1mYtGZviBTGCP0uNdU6gU/ddh57isbifv9z95Q==
X-Received: by 2002:aca:ef0b:: with SMTP id n11mr180329oih.116.1545338488213;
        Thu, 20 Dec 2018 12:41:28 -0800 (PST)
Received: from localhost ([2607:fb90:20d2:a5e2:49af:e73e:5a36:3b50])
        by smtp.gmail.com with ESMTPSA id f127sm10873380oia.19.2018.12.20.12.41.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Dec 2018 12:41:27 -0800 (PST)
Date:   Thu, 20 Dec 2018 14:41:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] media: dt-bindings: rcar-vin: Add R8A774C0 support
Message-ID: <20181220204125.GA26550@bogus>
References: <1544732519-6956-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544732519-6956-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 13 Dec 2018 20:21:59 +0000, Fabrizio Castro wrote:
> Add the compatible string for RZ/G2E (a.k.a. R8A774C0) to the list
> of SoCs supported by rcar-vin driver.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
