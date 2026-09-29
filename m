Received: from mail-ua2-f34.google.com (mail-ua2-f34.google.com [74.125.226.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F373ACA42
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669554; cv=none; b=HdL54xOEMqYsWA7mv+UjGIhEex4rfFqptS4ctP9HCgKzCDRO87EiZZC2fo/4i3CWjzXCIa11Y5sq/NCgc1R0O7lZUNsCSk0bsh8ff8Wpdx3Kl6hytWUJz6XNXjm/ngkhT2+Hafji20LbuXMCOp9Wkz7PTeHxZJ3TPMiD3gQTcfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669554; c=relaxed/simple;
	bh=e8jTQ59tb4Ke+Zmo+wcDDbIer2Daet/lCXTrHvU+JBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjiKXlxL2wvpq0LSI5ut/RsM2a6y9pbsG+tG78DiZcuvBIPAZWFuoyycisUpiiVWEbQ6mE8TC0+1muj4CqvFx8wGNBpKwCwusea1uLHYDjiHiCyMWSxT4kCwyLL1hJu8apPsSH/P7kVu5SUmL9IOIiDL3r9bZf1uIPf9x4PFNiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f34.google.com with SMTP id a1e0cc1a2514c-982db8d3ab8so1955294241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 01:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669551; x=1791274351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wKTPnbd7pHw8WKn97YDxHbj3C025J4UMPNethHoNt9I=;
        b=oW7hLBwy/DvoFIkbgxnN7zqUEY2K6pYCGkeOx0xUNPSkQOqhPHwvvtZmvCOv1qOrPp
         3bzZnU+ZMRzaOdjrvmPjC3z605/aCIcn08iNd589SqZjtvM1ATGeFyLsd1IBTPZCi0QC
         QndEvzUX+wAuQxvtPke4XTwclHK+gRaydzwzlSCSOixatNNNyPybmev3scEkywVCTjPn
         gVwV4OmXl9NzeX/qcwpA7p/r662oQjnx185aCBCndE/69bqs2yBi59PMD+/rdEdOfaT0
         hcNYy00IQxRxPEhXdlipBc2jMO39d06LTN9XySYq84pJp/uurRlh34weuD3wu9zI7H6I
         +uXw==
X-Forwarded-Encrypted: i=1; AKwUvBzkDiGmEBshJAk/iwGRZ93vVjxwH7bwCS9Wn/rtyyvAzkInftWRP89KaPUnbugHWRPgZOEmFeb08gWWWsO5z4xGUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkGzDyPiQ83icVTOdKRaxtlD5SpZz1vo3I85nho+kR2MR88J9r
	Djs+FBsO079EFrfn0tCwHtXkTVhHq6rOyQP3StPi1BjLPua5RVUG7xmaUvX08lxdIzI=
X-Gm-Gg: AYBFou1nYMkp2A2WQCQaUTUPkwESKGUlpfVpHHct3U2dso96IhM3Olvb3u/YF78sXJu
	7BtUkRQ1cO6k2/ejgSqe0tJr4ouZcdnnpCw6TDb7YptwVxtsOa0Kz+kLROCqmME0CBB0HUW0owZ
	VvHs9SrfzM/5+N6mCnI1rTKYOKIjT+frndSXobmltH4/Em4SuiBqfqz7wwBL6vcBFt0IJ0BmmW2
	tHl8/Vdkm0pJ5OP+7ZNy+qNYB6YX2g864/s5hInzagm7kcuvmVEJlfljKGp+n8geCUYZc5zrz6b
	5pdWo1peIxL2n4nhGRMkp8QWZs+i7FG717+ID6hbO4TGtDuWk3jjgevVR+XgHBUOovJka4k23Zd
	QteS1fF5Jen0wg46QSO/n7m/4cO7rzbRjAFgJY7/MEKRWAzqrtRMqnRuqVf8R9ZgkCGa8Hae0gp
	DXq84S7NZYJcDIwX6nGOCNnHx+f4BESc5Xs9Oxks5qHa0sr/eOA2qqYl5Qg/36RXXQEPaT5xBa3
	naqlDlwFc8+0LHZK0RuFqshd4201pNjFtEQGv4=
X-Received: by 2002:a05:6102:5346:b0:7a8:15b9:dd34 with SMTP id ada2fe7eead31-7af1c58fb71mr6318348137.2.1790669550710;
        Tue, 29 Sep 2026 01:12:30 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9ae253sm12470353137.8.2026.09.29.01.12.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3ab8so1955278241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 01:12:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAsy40NCcW2mShXunA8bIujN2v03GiPXazzQJhlLV2VcF64V3ddkQdwjLAE9hKvXRYd6sOnmFvwb3zIl2+B4OaPQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5346:b0:7a8:15b9:dd34 with SMTP id
 ada2fe7eead31-7af1c58fb71mr6318332137.2.1790669548884; Tue, 29 Sep 2026
 01:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v10-0-91752ea39cbc@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 10:12:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
X-Gm-Features: AclHuK9FhwKj6JL-kiqTsnzPxsKOECrpai_keY8LaopHP5dfC3Vjj3Wu8JulErc
Message-ID: <CAMuHMdWWoH-m972X1Emo6gis81-_TUs819gOPkUwtgnR3aQhGA@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] arm64: dts: renesas: Add various SolidRun RZ/G2
 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 19:34, Josua Mayer <josua@solid-run.com> wrote:
> Add support for a variety of SolidRun RZ/G2 based SoMs and both
> HummingBoard IIoT and HummingBoard Ripple Evaluation boards.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
