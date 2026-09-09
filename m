Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3661E7C18
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968011; cv=none; b=iD3/agxUWOMsQi2HA5XVjuKf09MHZDs5sR5qng7gmtRqB9ZG98/Zh2kqukXwSHbr7BEMmbB+horaxY+lO04h3dq/a1kKokHdW30gLYM52Lajzz4BsdKo31WmKmxIIma9E2hkOhUcLddUxdVvIEPQ1oHoB96LmN6416eW4S60lt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968011; c=relaxed/simple;
	bh=NMIEtDYycWmV484GpSBkjLc+PGlo5yjc2c6VK3ydHI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HucFQ6a1WX/U5jFNy3c486TX3mkKYPutXLeiefdr4k/bUB0d2U17Qim+wVka0GQauNhTYd2aH+Ltf3bsmCKE8GACUpUIOOU49C2hbsgH2h1/rZliSgimRRaxT/3IIOt47JJoXBYrS0gktmo6TiMn/egf0fTxvmQXk2DmO6leY1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso2909287e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968009; x=1789572809;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=seHJEHV+vbkaWfT2PmVXZhUQLZRva7SU7v2d3J1NVwM=;
        b=h1qcjhjBj4mqkFEDLtJ5P3AU7cr54Z0WvQMnwD0un39yCYNiv2OtZ7K8qGtq1ygOyo
         3vRPOwHADtNvoPb5Ih5pK1MXKwLIcswbhMOGpICzIUXhy/3APs5nnyT7kLuYjREGrCCc
         codtcgYsu9t+U33tTpatYLw98sJlwTxlOpfKJ/4brcrlPHxHXG0gdplbbAzvxlBbLDXo
         I+klzYRPgr3YrjH/AGucVddfghGAHRGjujPmiX2EsE7co88BNsCIS7r0cgkndz1Sbe5p
         vONp6OG7qvhZrdxo3crNXfgk9IcRRBmTj4023YohOGOoYuhKYk4UaqsdvJCjHByXM56T
         tgEg==
X-Forwarded-Encrypted: i=1; AKwUvBwMifJPlK54XyM191q8KBXOMOYJ7PSUCkThYz8Vx3wp+HsHGMAYFkV1WPBxAnWcT7Ffi06EFFMzO2heZL2r+CEPVg==@vger.kernel.org
X-Gm-Message-State: AFuF++lWglN8lRtN9W1pC6fi+SMrfkqUva1QoAN2DR76mqoqk892T4SZ
	PcwmpPoWtYFzHMsnrdXVWodl6+26mef5bITsifK+dOUTjkHQ0nevfehKfYkWmqOZQzM=
X-Gm-Gg: AYBFou1HjE66FCpj21p/V9aJ69qyWBUWDAeAvukEiyiYhx8UcoAV+wz/7+/M5YWeI90
	u674RH6flvEPD6LBU9+mDSAYQcoL4xmiKFmm15kJ9V6MLM+dkKsbYqOteuQTQs9HimwzZ+JpUYn
	Bx5hlMICGPwLQ7YTQF/Ag2eCrhy8DiylbqkyFQYTwm1YyEW8NkVO9QEzA2PCXJuLp0hPmpcCrdL
	u8y9qjRuRj9lQxUOnL8m/bCvk+Az+VPDsHNESzB2LMmUVSCRvb+3YScaWeSSR9qd+lqxpTrL2gv
	ngQDOFFq0SIQmcps5O4YaDxmyB9/hX4KoTFchTGDy5NSAroKENzO79gn2P2Q9qTxcQM5Off7hyn
	3iAB/00wMD6uIjBIn0L9cbf5BkqH8sh8umbn7xnQKxyTSJSRXBh1XS0dz1Th9WjJfNd4XYQquua
	ACxzEgp3c5VN6o/FXeOID+zqKCJVGb0MtTzhj7klr4uwOkzKtDpKQCHfPPKLJsgBsZiDfp1CfN4
	7X02aahKftZgbxWkb7QU7uO0cQ2XKoW3liLetOg
X-Received: by 2002:a05:6122:179b:b0:5c7:b165:7057 with SMTP id 71dfb90a1353d-5c7ed3cf5eamr18891236e0c.5.1788968009022;
        Wed, 09 Sep 2026 08:33:29 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8221316d4sm3726302e0c.1.2026.09.09.08.33.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:33:26 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c7afda4515so3409795e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 08:33:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz12MMsrdPzfO9gzHbbXl79sRt2ytBrdFSehvsI39Owq/YspxMkvu1losFasXMtzFgLm4CHQAAnkfsmZVNuovbeUA==@vger.kernel.org
X-Received: by 2002:a05:6122:4f82:b0:5c2:ac92:eb18 with SMTP id
 71dfb90a1353d-5c7ed3f6d2bmr14626613e0c.7.1788968005930; Wed, 09 Sep 2026
 08:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260908162323.16440-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:33:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
X-Gm-Features: AcwNN1UdM4cUGYydPQaEaeecPmIzkWQH4nuP4PrjWCOhXFLM5sncau6pHe3OeUM
Message-ID: <CAMuHMdVsfPrHQ-bPSbZnQq8q-t6erDebddnf5Mr9+6L-8oXC7A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 18:23, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fill in missing #msi-cells = <1> into the GIC ITS node, update
> its-parent phandles and fill in 1:1 msi-map .
>
> Fixes: 7fe73a3a3f2c ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

As the original commit is not yet in soc, I will fold this fix into
the original while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
