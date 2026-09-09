Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBC7379C46
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979913; cv=none; b=NMZPrMOw/woG8fpnZLX9VviuVnxZWjNYFoJY4eKcIuOX3QuyLdWzG25WgtHg4n52RwcRLTwVg2XSBbGk6sFlau3FdvWammaNqEHU51zhkRerINV0S+LX6l0v15eLDMLQx5wKTsuXZBc+QhsXPvPYq3sptfEd2yl8KFZzsIOG4hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979913; c=relaxed/simple;
	bh=WYM63RP/6qIs4Sb9Jj4o5ZhHuFQddVi5q4PJ8caVcwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gysZRbRv9w0e1YgbLrjgFKmO8T5dZ5qlNlMfkI++71u7RMwDEmIC1k8HixjlgtidMqkJWxt4KMZqZrSbpvAYfaissbP+9Vc2BqwqHgwIgzXq1uUetbeJxxlPJ8j2B+IxUce9G5Vsh/+QpqNffCipLyK8wdRV3ns7+HU1kuXFlpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso432372241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 11:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979909; x=1789584709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HGn4boZ5W+dK4Lr50YdWTU0/URer8oxrazbRXftF9gU=;
        b=UL8zWdVwdHGDxMAPystAx/3sRwh9jK4/3M9UIQm2pqvH12ttE+EV0enI1Z28Xc+k+f
         ed1mH9MUHAXRVbA09NNktn8d1hMrJYqOXhlSEi4kDSRJD/YfHyf/ezMvb97LbyKcf5xX
         PzvRxjssRRLZDXeSd8AV3FQz1GOzn8hl4Yu8bcqZfRqkr6cD03W3S/3B6tgPaJGEaWsp
         kiyR34h3OonHODe6+yMpmDw8lHg3WpE1s/pyvnv47BafRn1b3Ls9nJAgSQSIMfxHMJeX
         cmmV8/oCbNBjq1rP+Osz8MC+j/QuwK4axU73rD9Dp5/xEYFkq3EDgRITGNZZjvDvePKo
         vmOg==
X-Gm-Message-State: AFuF++l+w2hC8HFDPy0VhPSYRXIE0JpjoTm7Fd6nV26GqHwg3zZGotZv
	/j4K6/+RYwxN7Gp9BBGya/0AKTNizquPwMIun8XnYoV3g9Nx/0bjnz2IhOl3vj3rZTU=
X-Gm-Gg: AYBFou2FCxK2lgmJHYU1xBM7RAsE9GugTqkNJJgje52TUUicGcutJ9GaR6WGzdCR0U7
	YwBZdrV+FFsAIz1Bcn0ZBEjgRMcZsqpEvA5tTI6vBghtzBj1W/CoJHgax3D4gP5gRugXzsnP3Hv
	zJtznjZ5at+O7eUKbjlvBaJqVMutZjq0e0a5sTE0+e0BlexmBdBmxlcpDpM5xvmxypGC68n9zVl
	7kIppB7ww68atS5Ru1Qeh/FRP+N9KDRshlo/YxW4QROsHuQEPOC68Wi+tubuQgIZGNvMrhTAFxk
	BOVZm9OtUHZUa3bLe/DgPkglJ4IK9/0UMKkqXfsALFVJwCLTlNLiN5J/A17fTPT90pPG9MWrkFv
	o3Eix6YO6zxaMbwl5szVdWTta6/aFZt3rkCk3hnp/0IT7Q11F1vQWPd943W+sV/EJtjRSdG+FQR
	IaDDLoq9IV5x9cAcQ8MmCDIUf0Kf/9B2e13Zd+p0zBDlnU0+3+zB4+L1WCCyOEGwVyeUImvSBsh
	BcHJbneB0SY16KjDcZ7MvC+l1um74O40fbku8Lw5ctxnH9K
X-Received: by 2002:a05:6102:3f87:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-78f7380daa6mr3016909137.1.1788979909502;
        Wed, 09 Sep 2026 11:51:49 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9819a9dce84sm5145285241.3.2026.09.09.11.51.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:51:49 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-980b6159d30so393713241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 11:51:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5789:b0:785:d308:cc0c with SMTP id
 ada2fe7eead31-78f7423f6b2mr3129457137.5.1788979908893; Wed, 09 Sep 2026
 11:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909184200.3319-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260909184200.3319-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 20:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW585F3vRqpKxgCM2EAG=H-y18o-6uOVU2ff4qAdS5+SA@mail.gmail.com>
X-Gm-Features: AcwNN1UDLjSSsn8pxc82wy-nfmiOus1jbwsmbeQd2feYUj1SY0-1MOOdJjYeqTE
Message-ID: <CAMuHMdW585F3vRqpKxgCM2EAG=H-y18o-6uOVU2ff4qAdS5+SA@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: i2c: renesas,rcar-i2c: allow 6 DMA channels
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 20:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 can make use of it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
>
> - dropped extra limits for Gen3/4 based on a discussion with Geert[1].
>   I dropped Conor's ack because of this being a bigger change. If
>   Sashiko complains again, we will ignore it
>
> - not a a change, but after an internal discussion with Geert, we
>   concluded that his suggestion of raising to 8 is not fully backed
>   with current documentation and we keep it 6 (for now)
>
> [1] https://lore.kernel.org/r/CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
