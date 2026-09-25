Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA8C4A3847
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344428; cv=none; b=nUmw6b6BllQaJPW64nAhPcuWsnVJxBSJU/0gxIRrxay0LDbp4Qvze7V3JgVniynV4n4XlCBRbWcrE6Hqh5Jt4wmUWhe63V2eWKeTZ+0CjNxDFUGTd1Be3zW18BueKV+lFhxuTRk4Mbss7mb9MzHXNd2S0+7lH0PQn2xNTj5pYYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344428; c=relaxed/simple;
	bh=hNw6vrHbhx2PblfWwARxPslf5MioPjYbwh4EEsJ1w7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJztXdoG3X2CaG1dzQaPRGxf+pmJ/iWu0ALS55YReD8E2SwACP+suq9Hw/9V19TILSr6yuWyVlW7Ubez3A8KWQ7Mk/zZd3V4m6luBFV7GZ11ymvWfXsTqzxYmFd78/XgMC7MQFu/YVS38j/beQLAQXGx0RRC3VH+9tB+5yIp/gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ9muwFj; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ9muwFj"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so489084b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344427; x=1790949227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XdrXdgsFzarfUhjEFq1mXLUok84uZ5SW2Q9gL7YwPb4=;
        b=nQ9muwFjCB8DFVOejEprVOhZXlOcf8jxTyJvfDaW0q/CWONpY0zSkeRLrXeqQu0zlH
         thU5H7Ob1lVu0qByqV9kmsH+BoD4+tAVLDeD0QTzljgZkDCZZ7cMstjscaJiuFELrXgk
         kV6dnDl+sdvY/VC0LBqKhjx7GyjFcjPpOE8/xADZfF+LXzVf2VyXX1mJMtBVQ0F36Jit
         4bNhbxHWMJCexnpR3t0+hpXkPxv/mRs20Iq25AOU1OgNwNXps+ira3n7XftkJcexy401
         jo+jhhS6rxNnctnMQRYsdkVSatzlVVkj1I9atvG28borFv9NXTbi/w20UTKLj1l5nK+O
         UKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344427; x=1790949227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdrXdgsFzarfUhjEFq1mXLUok84uZ5SW2Q9gL7YwPb4=;
        b=qwo+s919FhYm2BvdQIGaGBU9J8Z4R6YrOmNnijY+q84Nm9HiNc249Zv10aDmpyekap
         QufvzfiaZmbiuOiNROb82CO7xQ2ntIetK8nZ7QOdErGS9tYEQv5GLUge6tr0+RX4nVk6
         pIjrg+3WZAA9hGC5tctv6SyHHJr3kfc/H36ktnys1BrfzvFsVqMuNEJTyNF8NtU6d/dR
         FaUVK1UH8h0JGe6ItxvlJgQEVyEX60He/o08KFiUn67FvbaUW07kQxf86uKXt+POG3/0
         p8dONkrE0Yaqf7LvRQ/T+lNbFLWtGnyaDVwP+nGvZkvfyK8jcm428+qX82z5gpmmu/IK
         r2Yw==
X-Forwarded-Encrypted: i=1; AKwUvBywKvP02sWprvc3NzXYhTOjZR9LRP5c/0pRPYvWo2v9stXh/+9LHFSxlp/dyaz4SMhfq6hZhVSQflxuHjzNLIy5RA==@vger.kernel.org
X-Gm-Message-State: AFuF++lsytJlXjXArQ24hKkWGS0KFZwSm0o8HUXNP3ONKz8vGxCEZqto
	BtkrNGqFFDbi4djvccU21KDuzqkm2VIocipmLu4sTyGBTcH9SBQp968r
X-Gm-Gg: AYBFou3kG3GN1VSeoA66m/TBgqjSwUh9oaXDs+e9EHS0Ci1mREBW+3NbZyX2B+8Fu2I
	Vuqg7GjusrvC7pQ7OM1vUbtlrV0r6ZcP/JJIa2TOxYGrN2sW+/UUMcrUUSVzmNYOmjpeQn4n9ay
	mEEU4CzSoeMK6GM4/1CJWtHP+wjy9l7W+fTnOpF0tE8kXu509v6rPSrT1udyHUY0sKSWX8uE/JS
	MUVa0btrt+AT9iMNpx4doDZqGk+aE2c7CpgxWhIcUEI2lc1moi2lXilIW8WPSQdI5pMZMF0sFuE
	5KMts1gwXFhqMdCoote0knwxd87iRi80kfza+o3GAClgpqiZlRWluUL3s9R2tUj7QRhoum6Oyrt
	nb3nGUp39tgQIPf4YsJqj9NOJfDVmorubOmVKbwVlolXnj5AaJFHMTCQtFwXlSxT+6Vv+0apUHk
	Fn2HBP6vpWrrq3uarofuaOTGdwvEMZ4iaUzCLhqBIS9M4zxUaCnyv3oGsCWziTqorWy8TtdFlju
	qLAeDNmnIUS
X-Received: by 2002:a05:6a00:6c88:b0:868:f29f:67c9 with SMTP id d2e1a72fcca58-87e9899515bmr4754627b3a.9.1790344426713;
        Fri, 25 Sep 2026 06:53:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea888b10sm1160362b3a.29.2026.09.25.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:53:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 06:53:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Grant Peltier <grant.peltier.jg@renesas.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	colin.huang2@amd.com
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Message-ID: <6c0a8e93-9fe3-4389-8d59-08df49cc54e4@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
 <20260925-hysterical-otter-of-courage-bc6ab0@quoll>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-hysterical-otter-of-courage-bc6ab0@quoll>

On Fri, Sep 25, 2026 at 03:06:51PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 03:16:36PM +0800, Colin Huang wrote:
> > Add support for the Renesas RAA229639 and RAA229640 PMBus
> > voltage regulator devices.
> > 
> > Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> > driver variant, so no functional changes are required beyond
> > adding the corresponding device IDs and OF match entries.
> > 
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  drivers/hwmon/pmbus/isl68137.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> > index 2f7f825bfb69..15b4e3f15f11 100644
> > --- a/drivers/hwmon/pmbus/isl68137.c
> > +++ b/drivers/hwmon/pmbus/isl68137.c
> > @@ -456,6 +456,8 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
> >  	{ .name = "raa229004", .driver_data = raa_dmpvr2_2rail },
> >  	{ .name = "raa229141", .driver_data = raa_dmpvr2_2rail_pmbus },
> >  	{ .name = "raa229621", .driver_data = raa_dmpvr2_2rail },
> > +	{ .name = "raa229639", .driver_data = raa_dmpvr2_2rail_nontc },
> > +	{ .name = "raa229640", .driver_data = raa_dmpvr2_2rail_nontc },
> 
> The entire point of fallback is to avoid this change. Why do you need
> this?
> 

I personally like to have it for this driver because it makes it easy to
track which device require which configuration without having to track down
devicetree fallbacks.

Guenter
