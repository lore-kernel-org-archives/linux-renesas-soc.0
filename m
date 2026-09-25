Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760864D796A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353684; cv=none; b=L/TqajIYJ81UtgPFwLTvQCtkRS3HKOVBghc8pgPh8dsoFnCMoVWGns64n2I+tlDEitSHNtXyl/l27YsSOJ9x2BGHWjsKmCbGokRjmi6a8QAjkGomEK9sg0+UtY1F90F0VuCUVPek1XQ+fX7TQy2TKcgDdS2H2ScXO3MkDl2Ur64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353684; c=relaxed/simple;
	bh=Zx04GRhESpJuwUwQXfmh4GagFMWyql4BZ0xKHRNyTGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ke8EZPHtz5rPfiOjrYyEPloJMsA65uNbRYIIJJhipppVuSSo5pdb98oKVBe2TGy2nEuchSZIxQ22cZY0y4ZoVQM8BkJzdRtANQRJeMpd8UJYHblnTKr75/NmWgDjk4vFhNdsEiquXlhSBsP+hMBhg+GMdP1b1sohEhxceXa4L3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLgFEotP; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLgFEotP"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so373027a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 09:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790353682; x=1790958482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=bLgFEotPQaJQDLcG26mkDYsRyezk4a7D18Be51OK2rd8p6pgtyzAO6g5OcOBHmZ4LA
         B91ZF41fjK+Pb0bNegb4F2d8trww0Sh0Ji2z4e9nNnBlyM2ffuoXpQ7b0EEaTngjyl6+
         paNx20v27X6qtkeg7yJ7/sqMjIu6tCMa/ZjP07FE4MJpmTfHPZ0ylWQk1MoOA/i6CYGy
         DoFDc2da6eykpCPMzQLM9rOBsy4bME7Bt29bchbCNcDdy+0E5bUma2HqHXbquKWaJhSi
         GzA4Z8fU5hNMtsiFDBmUnB4XCGPhDvLcFCqpOINWH4z78naRWINxnHMFFNYt+6y6LayD
         2vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353682; x=1790958482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rcjiw7TZKxqjqC6qmegcZrxlF77WDCcypKbL5i6Weqk=;
        b=gDbidpuziOWFDgtJzs3J+RetLJYIEFMMj2OgRmWbP8n78yhRG4YplBNmcE4b6tQbI1
         wsqEJbm5+ulmOr5Ra0F42Rm+zLx1eCnUNSUjd3RW9i3X1CGkqJYXf4bPeMw/fQ5ppNrA
         n3ox778HP9Z3ciKdy+50j2lKoIhtCtM2jIeCfvslmBTHUJ1UzIngbRUqFgPWbaDgqImi
         SIh9LH4kDMTXlDYQCMkGKzrzMJo8UJN11DBnPA2kfsVXCue53eRWH3oP38Q3xc/jsa7P
         U4H/zpdcqa3xVBtkZf9XdFHdTJInyKNm8eVJph7IoTrbpH4rQCxmZouxyBlrfat54Y64
         Je3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxseqqvlvg269JZQqeB0RsivONEyk2kLbpGbqX1G35veD24nNEfpqZJmruKQB4BTWMxOow1s6Ji4UyyNgalQmcDbw==@vger.kernel.org
X-Gm-Message-State: AFuF++kVGNM8aOwKwGB69KiGLa4bjYy4mXGBgWu77L94S2ajMhGSOZf5
	QQcV1RKwIfLs/jyyydAQjqSh+fO/ayKX4smgecaE9BodilhTzoLvn1Ck
X-Gm-Gg: AYBFou081vVP7rW5aU1HziEvueUFqpfTlW3Hd0xxOmvfO53jRRvJ9lsUTy2cXazBND2
	uLCCY5XUFk8S4eBCeio8qI09RqDUNhoWasNI/QNZVZQgBJuO2iqN5dwL7lHRmM+ZcDgpJTO7/cJ
	ng0OzJYuCX0igl+MHY3Fa9CSKKCs8Zc766xozbysICh3LlBp0kr+6A/q3HUZ8JIS8i3KAFZGiVP
	gq+RGXUa5fcmtG6vTZutfz85aMXSROHds3PUUwKFBsd14uPZGRpbHZsU1RnRLpoMlsQlSUIPI4z
	StrQGYAJCXeNVLLnmjhA7QmvG4LcdPHEq5LC/pFbQmLobwTgEzlXgz6uH2vDlfrkzQhOSmbfncy
	cyQDcgRiNZW71IOQYVMhGUb+XvB6XwVT3jBqw8vshFYZdDh+rjHBF3GzAV3Kg+xO+457TCtP5Un
	wgKl1Zt9NtBi6Mqx5HJQM9WDd0PlMUdYhBPPLsCkUaedI/GU3EVV4wJwgSzm/P7KQ311sUELt/Y
	svN8S5p6Csj
X-Received: by 2002:a17:90a:1c89:b0:3a0:9dbd:431a with SMTP id 98e67ed59e1d1-3a09dbd4752mr3475490a91.10.1790353681688;
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm12819580a91.4.2026.09.25.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:28:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 09:28:00 -0700
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
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: isl68137: Add Renesas
 RAA229639 and RAA229640
Message-ID: <fd18f46f-deec-42ee-9574-91c71cc4caa1@roeck-us.net>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-1-b104ee8a70b2@gmail.com>

On Mon, Sep 21, 2026 at 03:16:35PM +0800, Colin Huang wrote:
> Add Device Tree compatible strings for Renesas RAA229639 and
> RAA229640 PMBus devices.
> 
> They are compatible with existing 2-rail non-TC controllers
> and use renesas,raa228244 as fallback compatible
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
