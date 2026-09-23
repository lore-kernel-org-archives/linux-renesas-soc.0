Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952A348382D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159746; cv=none; b=adKaAlODlKuUQMJmA8e6pCLTyMb1+FMutS6PYDg5fbM/+xMaFA7Lj2ntUjgL4f6lCz/Ll2gLhzJeHXfxYmcEJhy7fIgbhkm0Gn4TKtexdS7V8YeZ/MegmsOqWraoZaVYJYQGk8tp+JSJU7P/jN3rSIVETaRmBxec/rzbHWTejbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159746; c=relaxed/simple;
	bh=4vSnFRyrnWw1NiPCPc0UvaiFDOqzvmfhZ4d+f3+l7pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jq7nzw5FTqAsZMI4j3zlEphJjqrcREtPnvPrJxsdqcgVBnsHWfXe+U3P/Iih+Ynq76Mn/yknAQGShuFdblxd7UKvBPAzYOslUwSf4CfUFDtA6GbxXUuBO4Kp/PhdNvd6SblHjNLGi7Hd8dnei5mV446YVQZ4i2oCtd753Tl79+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93a0fb2f9efso43531385a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159730; x=1790764530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4+0mGr2LVa/kdmweLtRn6u4eyOMGZ0oEuJRaGtsK3Ck=;
        b=ZlWdxHzldZWxXQ/aDna7UCyw0ddX4g2e8QNIy0RZLTo57pNjwg104F368Qdjcz468A
         /OaxKsGDXzThHMsYTAsgKrSE1kANd9ToycJT4lsfuQHo9ebtE5SGc9w97eTlXbYpKDH0
         jcVI1AHcwADQ1pg57qOLpvmNRKPLusAFurYhmRTfQnqHLCfRwOqXcq12izLQbpsHzfmD
         Vf8xNwDd1xJUWL05koOlG/yp3I1PhbVF0agOQhdB52GYYWpycYuRY17LT0GdozS3elNz
         g1m4rdxIVRMXkw6qdF3P8gcw2PiN17Y24oTWHqWAjIvFPgbpOr07kXSV8BcHUECgUJvf
         NpAQ==
X-Forwarded-Encrypted: i=1; AKwUvByvnxqFYEi6pQvBcz1VtLY6rTlxebEwRt7pAXJsFRyA1miGz/Z+Y3yU8JB6h4/x0NBWHhyOD9LywLImAww7jVzeGw==@vger.kernel.org
X-Gm-Message-State: AFuF++nmNgxLfTjjhkMY/3ifVAJOl8J7ttGw+wl6Xlm87FNbxDfvcvdG
	EaYCV8neBx8eVFR1ITmWQ9zYobOQcV5QKtA8wls98vzKrCdcf6+lLx98EiwS8x7fgN0=
X-Gm-Gg: AYBFou3h4WWuEwy4btZBIZanOqE08HZ1gHcWCuWdWopR/bCTvf3BYQtqwupvxPYrO2G
	zu1nzf4bL8ycRV7jlL36T7acKNL41eK85m1XE2fycV/u4zaCFl8O0JgUBbTrAHlKYW57DVUikkt
	QgkhNsg3CL0fbCXWMhdqt6Xpw23T9cdNh0MMG0DS6Am18hCs8oMsBg6ZCFW85d++KMbHEKeNbVi
	pHkAp2xD/iOwN3ynRaMPHUmiWtmB9cdv4vPcop4N1YjJLCXGarSZMxm+uoTGyhHd12Ks8qWFL5Z
	IxuxrZ+Ei1YWgYAn+8JBSxw+xVt0jbX+ycZjDildXZBmd7ambQ/O/xj22wWY1FHa/XnNQn8JPmv
	/jEJF1jht9YqtwwjBQq+0yi2yhjCmOmNgRM8Cek0BwfB9MjSOSPVMxtpPGLMZ1vTOhQDJFZBlvN
	vLwxNG9966scjky2MtZ4Q+p/KscZ3pxo5xMD1WSi2Ahr2Hw5xhGT+oB4UDtDJ2vKhng/Bo2Oq4w
	ZKSwV6PT2X6ad4Q/U2QFYyIi5pyoc/g/OAUPFd3acQkYpKf
X-Received: by 2002:a05:620a:1711:b0:939:b783:1748 with SMTP id af79cd13be357-93c17e14afamr897883385a.7.1790159730349;
        Wed, 23 Sep 2026 03:35:30 -0700 (PDT)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com. [74.125.230.204])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140c410f3dsm17587026d6.23.2026.09.23.03.35.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:35:30 -0700 (PDT)
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c9fe21so31185485a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 03:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvseN680rwGGV4/NSxJIGb/DJNjdOynarvN9g+PoU3cjdeHSFjhr9AITf8Uh/8Iz4WeW2wKrX+FnUS69LInksgrA==@vger.kernel.org
X-Received: by 2002:a05:6102:1446:10b0:7ab:7e3b:bfba with SMTP id
 ada2fe7eead31-7ab7e3bd9f5mr3203843137.14.1790159402747; Wed, 23 Sep 2026
 03:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-2-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-2-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:29:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeWfoqLiJQXBbbha8LwQ=HSYnoXs92A11gjFDZ-f9eHQ@mail.gmail.com>
X-Gm-Features: AclHuK_YPTNd9n99xYnNvuCZvr7Q9bz_jkhp3XejRIht4VqBRuZcUWZrT97Imys
Message-ID: <CAMuHMdVeWfoqLiJQXBbbha8LwQ=HSYnoXs92A11gjFDZ-f9eHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: power: renesas,rcar-sysc: Document
 vendor-prefixed header paths
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Andi Shyti <andi.shyti@kernel.org>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Update the top-level description to also explicitly mention
> vendor-prefixed header paths and what the asterisk wildcard represents.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
