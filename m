Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CF6C37123
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 21:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 296CE20844
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548105070;
	bh=BkXHYiLUx3D77QWBg3OjZdyKQS7eb2OJyM0n3KxXsH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zvczSCduNO+MtfI00X2BWLPbThAbaNg/dCWMpoofWfK5B0PMYjuL/o49LN9kRWHU0
	 yIssR5oGa37H80Yx1+nU9/zUp2BIZRQvS0S4q3wLF7UEl+wuX3O6Nqk3gXLAiLxNj0
	 7wJcbTQJUyxwwTcISLVp37ahwe4f7MHeLbn0Fqfk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfAUVLJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 16:11:09 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38571 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfAUVLJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 16:11:09 -0500
Received: by mail-oi1-f193.google.com with SMTP id a77so15655740oii.5;
        Mon, 21 Jan 2019 13:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9L6YTuh9fm03w3Sb6LGr4FuKmnhnxfIA1HwCeoBLQJg=;
        b=qTpxlGf0bTNj0uAroD0G768y6O4OQwP48D7LsB02I68QpDQ1RmSW8V6z/LG9BpceGI
         cxLL5XD/s8j+BtFuuL6ayZOwL8ZuxgqZdatFkm1XYq+SobsCzev3FWlI6d9mDgcU1KO7
         b7ocdwuC2QH6mWImiaxnAVQJhU+4jH77kg5rsSKLjbyn00xG05J/cOLdp4N8oc+8E9Qi
         t8X/suQ3d9J7xlGkLYIHvcyHO7TjUkH7TCsSTuYNMs7PU9lSPgKjv1GnJ3rDx8qCvVEQ
         8P+e6BAYourTEx9U9f/sykivVkHTIZwt+Uj/UHUJ+u88gZiZJD7jf6pk3BlFtFQFd/gW
         e82Q==
X-Gm-Message-State: AJcUukdfvVu/4SxXeTsbgDd04PWvxk3umOujlMUW0tmBGge8Ob3dX7rE
        tgMsIghVwCb4n4mg2yYkeA==
X-Google-Smtp-Source: ALg8bN7rIAWI7UCrfSd1S9KT+3KEfgpMls/PiQsRzp9AC77T0WDACyVvQmBAXtErH5QbErzpR7qFKg==
X-Received: by 2002:aca:5c05:: with SMTP id q5mr6319092oib.146.1548105068773;
        Mon, 21 Jan 2019 13:11:08 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u109sm6062858otb.8.2019.01.21.13.11.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 13:11:08 -0800 (PST)
Date:   Mon, 21 Jan 2019 15:11:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: spi: renesas-rpc: document R8A77970
  bindings
Message-ID: <20190121211107.GA791@bogus>
References: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
 <36b5ecc8-e7df-e351-f267-97a0d94262a1@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36b5ecc8-e7df-e351-f267-97a0d94262a1@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 10 Jan 2019 22:02:38 +0300, Sergei Shtylyov wrote:
> Document the R-Car V3M (R8A77970) SoC in the Renesas RPC-IF bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
