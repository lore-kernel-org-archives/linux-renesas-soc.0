Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E2324B06
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882214; cv=none; b=E+7W6hj9SfVMtybNHu0ze7x4JJX3y0oIsIJYoFxnqM1zR07NJ652Ye74Up4mvgUui69AYVMbxBmv5HL4X5JTPcbgqdEE8h0CwrcQ37OeHtk2C+U0oC0jcmDJuzvED7KhF6LIz1wddrz1aIXrQZSawXvEIh+4wi1bG+8RKcfMxw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882214; c=relaxed/simple;
	bh=i55soKzyISPt6SeH7DsGUlC8BZVaYjKOR1DJ+cOhbME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+5xuzOPnJsqMFm9+/4t4qHQyzaB9FgGkhMCfp7IjBTujxVRHvKhnfm37KCfAyoziv1YLOq56QEbolROGDY2+XN7SlZjDE7TbTS2x0CuYRxIRVi7cxyK5QC4Ng7CHFbzcjsw4wTtJFcwrjycMiq5QLtxVjg+kMH8YgxAV82uH/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M+AzQ7la; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g2v8UYLc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+AzQ7la";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2v8UYLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774882212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
	b=M+AzQ7laKRgZIgLyavxGAHMo9tVWYN99Z9Wb1cG7HaqDewND1A//PPysp8cGh4FsJdUGiR
	bGSiLsRpDD4QYdMuiio8rprtZWmonTxNcty1xBKbgj8xCHr84jdViRuKvvAuRjlQytb3pF
	z//FvCdzRdM7bvzwIqFPBAPAvcHNR/A=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-5jFVPSbHPJy8GXvrbMIpdw-1; Mon, 30 Mar 2026 10:50:08 -0400
X-MC-Unique: 5jFVPSbHPJy8GXvrbMIpdw-1
X-Mimecast-MFC-AGG-ID: 5jFVPSbHPJy8GXvrbMIpdw_1774882208
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b802961ecso57112981cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774882208; x=1775487008; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
        b=g2v8UYLc+5lUZCbeGy+3NZsYH3sOytXJMQ2BqC71X0KlpwQqOxvncJN2bH0EruVysw
         pyhHNYkzghXlYdI+hm8+GSFgMDGQaoiKLxPP0SjpKwqBZkMBSijkStHADsoiSzxcXuuD
         5VOSaFjOgdcqMBJFOcrywA0p8Oj+D9TSerTqHgkvjg+px1UZJLeynPaRE7HT+v/fA61E
         55WUkjRq8oZjxQ9ch+HAwvhuC1u932bN6sMwcyxVyXBUcVN0aL4AtddDhJZ+EEMUIBFJ
         4tzjfAk7fQuRLaHYDPwFt6wdKn1Jo7Ngz2hbtHq29Bg7l4oYGQBbkek0jG7J7WB/+Y85
         Im/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882208; x=1775487008;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ViefYB5GshkeJmDcmhUA4DB9x0JbvREJG28E0kRCIFY=;
        b=WNV/x02x/daItW9nV2oATMilK9OaQXDA/I8H8G0nNUZbZr6tZPz6DTKXZd5P9F88u5
         iSUOTpjj1CkO0M8WUvb2Oiw698jbuGyMc9SYoDjFbd/xoqfI8D7NdJ1HrhQQMNs7y10p
         oPRMGxDi6htKc9dVJ42BFUfICR3aeVbHEhHAALQ+z7RCxmLw901GB0wGUoZQ0/3o8Qxg
         MXVL56LSd6fnpyVeo8U0j9GuPl2KgHkrxPC+6ppmFA8cUBC5nweQgowFQesmlujTlXuc
         AEGetFZleTa5aX0dojoiQRIbCl98F3KsQfHc1XewHhBeZPfe9uWfCpwHgP6ia9yQ1OLI
         RbAw==
X-Forwarded-Encrypted: i=1; AJvYcCVk5x77Qx4GdtAts2sO0HScMKZF2RMazWUAxjYhDBiA5HZAvnmME4AllKdT388Pgu/k/GsSglEdAof1cr5YHZ9arQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxR/7OeKQlyZnLSczu5XEIHeVAbs5/C+SxVC6FTD5sRHPHmfKL
	ZVICgxHkQWrC62lJN55DEQfKeiE2mbxfcnbYE+6rHpVO2H1Uj3+39iq9fCGSMRkGXaIy4FyTLJF
	fwgwNRRoGgBom1wef62/9QWn1zuKznte5oUHjUMUQ66JKyN17Qz/28UR0u2GwqTdD8IhwlmuK
X-Gm-Gg: ATEYQzwzayAtgghJVKmunv6kRTdFi3eCvo8JREZaU30ZQOnAYotsxQ/i8v0ryl8lEkG
	XRB+Ix8K+41EHLz9ddh4SFUrbn//oSBuulmi8N0jtSoTLHpzCOWIvpNEr/oUMT+on8GqJdAok4n
	FaC7aSh8fQRxICn0d+fszmTfmaJwRupE+u86NLNj87hbz8o1VG5w0p5uKMYZntWATrw9MMxUYx4
	EG2ofBYY8jzpss0N0kFp+GgUTXspfuxU+KJHvfjCjw5OiuuVDlYURkR2Qb3TGnn/85lwKlWfXtO
	HALMA/lRQKw+7MnJjiSWqMfoHp7PidriU2qD9nSFuN7ek3+V0uuPMWl1vUf1FDaiYYk8xBB6XkW
	9QjLOmZx3veABlkKp6jlpv0fFf13z8Rm+NCWILazLU7EQ1d6lnbr8GwRi
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr188099481cf.19.1774882207662;
        Mon, 30 Mar 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:ac8:5744:0:b0:509:45fc:c88c with SMTP id d75a77b69052e-50ba3836f51mr188098161cf.19.1774882206754;
        Mon, 30 Mar 2026 07:50:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2e3ed5csm72731181cf.27.2026.03.30.07.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:50:06 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:50:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Antoine Tenart <atenart@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 08/16] clk: Improve a couple of comments
Message-ID: <acqNnIJl2PxEcxj3@redhat.com>
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
 <20260327-schneider-v7-0-rc1-crypto-v1-8-5e6ff7853994@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-schneider-v7-0-rc1-crypto-v1-8-5e6ff7853994@bootlin.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Fri, Mar 27, 2026 at 09:09:30PM +0100, Miquel Raynal (Schneider Electric) wrote:
> Avoid mentioning the function names directly in the comments, it makes
> them easily out of sync with the rest of the code. Use a more generic
> wording.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

