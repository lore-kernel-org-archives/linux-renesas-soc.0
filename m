Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F44DD3D2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353718; cv=none; b=rJPFts83csLLfyPVAJrlbU/3WyMnxYtGJJMMb0xt3ENusZqDN7qxK1Q1zlJrSlJMgHJ+mrgzcGnLSwYzS3f00Y8pjs+MQhctdhzPJkZU7S7NRh1+LUEaR9a+AH1OpvwaX3Xfi2krsbxw+B8tg8aA6MhJgptju6GmfO9Ih+UOXOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353718; c=relaxed/simple;
	bh=l+2wzoIOJ5TacTdwjQJG0rDHJINOx2GRB1xkArKzQmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpISEbbgUEdcEpMnDWH/8vTPaoyDxluqMxcRGB6U/Y7/SqgpIfIFYPKcOqvmxwkcVl23RFcnmJjsEyvR9WCEfvhPICZhlveHy121bqSARO/hEO1mLlPDyOVSemxiVfbdAtcgP6YcFebNqgw+A10Gmmlxmz387yJ/tHXlIvPK+xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmglRRCt; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmglRRCt"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso842960a91.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 09:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353713; x=1790958513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GwpFfXPotsrRNWGW8QfW7lFLTfBJDFVvrgvILRfxIY0=;
        b=NmglRRCtysELuQ+WhQ0EK8Zcvj6wIkxsZ7XLPhTxeY/C5+gnw9eds089MTLvdhZSFu
         iS1VSS37awT5pOsLretvGGyqAkcol8c1hsA3HufkGDLF3MXl+9PjXbNfl9t8859LOEgB
         sh5SEZ2a6gn5YQewnKhx86J8PsIywk5Je6do4HVJ+XLdEE7JASGdq6uW7L4CxikW5mWZ
         ufE40xJKc7ybYh7ka5gGXuo2WCqXkbxkEvjQ9NYLDkrYfAo/xOjRfKkzu23rPt+VgyR9
         ixnuy0iQsZ8xwQi5KJUROV+hK32yg891V8swgVFkUPUb+TCng9a6feaMsJ2qAObtNHRn
         JEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353713; x=1790958513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwpFfXPotsrRNWGW8QfW7lFLTfBJDFVvrgvILRfxIY0=;
        b=fyhXW6e0FaCpP+NHgC73eQAqnqiLkHYfwaoZ88QBR0f7ess0FYXhKiF1uzw50xyJeE
         WLrY1mi0NWOb2ovovMX0PoyZIlYShZ/oa59akUxQO8bCRXbI4clSKmS48PaL2pNaeCa8
         sJe9j+N+8/MWnlmq039vllv8b6P7obPWg//cXrQkxngo4s2gQmCPlmVm/VANXWxeCtRD
         kYTY2JMSigx9nYSEzA7hG0os5RNnzqKl4T9/OKfsTl4vupvZwNO7dTEx4YY2ib/o0+me
         fXQ4GV0szHFoQmT52AJZMiM3cHB7X/PObRnt6+vfCO+1LrUnc/C1/RHOprad/BJ89w7Q
         HGXA==
X-Forwarded-Encrypted: i=1; AKwUvBx2Atqm7COuGnZNQdFSmBf6O3Q7C82ac6pzgyPOsgrnAClUKMveVJtj1TwjsS1k8hE9BAZ2k2fggXpMZc6cw9BEGw==@vger.kernel.org
X-Gm-Message-State: AFuF++mXDYvAfkZeGkjfdTfqDjf1T8CIfrtH6ke7BTRkT75akYBFqUsT
	RGkDdtEYoc270kH0LbFDZUdbtzO1ho3RsHYUwThf3h2ZnExRSeuJQpJ4
X-Gm-Gg: AYBFou08qm5Z1fDQRRhl3CQ13l3essPVS/cR75golENizTEpUix99HoRwvSQRvLZfqB
	l2UdgjeSLeHRYP5rJ1wthmB7+KZhMXWGsD3oGCeVfTvfuSali4DvW3q9SzBEQYtK9YIgScRT2QG
	wmvltOYewxBlwP7gOSVPMM6XUCKQSo2kNyCNaxYtx0VNjTEvqgJUNXqCrqbo4yjqwR+7kXrbYbX
	D0A+cjeLQO6gqMlm6WEquKnOVbNOfchim9fCtuvtjdTQfqpJQX63fA89BcKi57bN2uFFAzq7vKG
	J/ySnLfg7aJk8/u+Hpxiz/nJBJghxpdUt2a75XWJxszXs5vYahA5vvNrpH5TJZGUJyXQooBVB75
	BKIDylFZDuWEhix6UDuf4PGqAuQfA5PIuCF4pxdUNOMFyFIvnxD0/tYnhu6m7j4g724OLJ/Xyez
	wAhE+y9D0Y2Y57Vbd8burM4cOwd2DqX2aWq/MyJgSu1fCcIuy0GNzxLVfOuPApJA82SPgU/LYvm
	3Jbg44JZZvYDg==
X-Received: by 2002:a17:90b:1350:b0:39e:6c6a:656d with SMTP id 98e67ed59e1d1-3a0bb630128mr2176047a91.48.1790353713455;
        Fri, 25 Sep 2026 09:28:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c7435sm12169939a91.11.2026.09.25.09.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:28:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 09:28:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Message-ID: <2301d0ca-9cfa-40e9-8250-4438d30a0059@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:36PM +0800, Colin Huang wrote:
> Add support for the Renesas RAA229639 and RAA229640 PMBus
> voltage regulator devices.
> 
> Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> driver variant, so no functional changes are required beyond
> adding the corresponding device IDs and OF match entries.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Applied.

Thanks,
Guenter
