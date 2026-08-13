Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15063B2D00
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613112; cv=none; b=foqdj6wHonHbmLu9536A2khHXSupyDyiGEu733eQ1gGjkcdWXdna8Y0mR+gdgVTcwuetaDx5TzM6XTpQB8/WWcGwamLDkoxdr8BM1j/bxcoBp3z1YAinKVUqgvfkV27AFVUaRzTdvtgEnQPAsuYZSCNmFyFpj2Eo3dRuavkoExo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613112; c=relaxed/simple;
	bh=z6DTFuPGv6FWaGZrtsoIb4p3tEuSyUOB0Uv5doIJz9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eoiPx6oY/Q+1uRR2/Mp+WRRjWZHfTdynqQXxIcuLLAjC114pa+1AvZh7hqNMi3GAunl57+S+jBtJ0cteaEhhY28VOhaxY0IJYhu2PrMJwBS+MPw5QWMx7gYfZFlKyIiKL2rLQGxCgVjJ1s3/3+lSqVcZe39ddzJe7zoCy+oUcDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-754acc61e10so775797137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613109; x=1787217909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RqwpdLB7TrtYeRCXVjCM9omQuKhZ1BXK2srBTA+xeu8=;
        b=nKEyskeiY5nR6jv8i7vKIIHnx2NzNqSfAAXBYBzXNIlpTwaJ7n3jIEaq4u+tS7GZW7
         AsDAPkhOxNBxQt0BDyvHFF638q4J7979hZhd6AOpW05QI9QIOQauzOeqoxfWaoKwJPL8
         8MPQabkV6Albigevf6mfjjqLE1/+K/C2bayUsBwbugAzTBGw4vz5FZof8UOGAwNFC7N8
         0mrGivBIjyFQVu7weM7qpPI+kyo1fFLLtg8EmA4o4c/m43cjUyaOKIlZAhd0BFWjD6JM
         P7ra/Adwlr9gsdm1qMQCgtIZaZ1RUY+fMZ0JPSEsQYK+u/DU7hMbgUab3+ZuJXtfzO3O
         2qqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSLR/Um5h8SYSjPTlJNTj2LNBSeUoPa0U7HG71gtyIlx7a15Qhd6EaZ+uupGIQk730LmDGVmuTGC0aR8/cB+5aFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCcdYmq0LKfLXoxufZz0C7gRKgNxHmA94q0stTHdbjaTSwrvt
	tXmyandGda5UX8ShsZNYuzFoYLOEJUEL3K7z97sr5w7u4XNWoSYfL45QMC+0oe8i
X-Gm-Gg: AR+sD10SyqxYnOmUSVDmbpfYNnRXnqpxkgFlb3JHMisVQ/hZDFIPJ+mJF0cQgCzTdnE
	dm6I9fikVkSSKx39qnLVpUBH49dAiyoagp6e8AiWKwhzbbySF5zMHUCi3MwzGa1MNBEqOcEjXRb
	8vf1tk1l+Q+rPdhu70IojHvXAIersAjwsiaiXfCSKliyua4vO5FhSwn2/CQcUNp5t22SXzdQcD8
	QqhPkSAxF+cuhRpeIS7XQ0Glc1XuFM2nXzJRk+Jll2+vSzxOh+198FvYiYcj7YKLy65cPpecXK9
	egjeLbndZkV36paxtOB3At5B8wG8EjH2KLzi7qdyXmgqn+xwNSh44u5cqDoiLhpKGyLyY5tY6kO
	WlpemebnEr2/u6IisR9Kq96+45UmuvOTILL8+IddN2MlbTwg5gm5a7WdJm3+c3ZasP8CNnrEmaY
	+A/2+q4LnQt0zx0jVE2Fs/ECIsyS98tqDgHWcJIgZ64Ihw0QbQFy4aXR100WjD+KnBRMmc3xu3T
	hwJbv5NPj7H8wVOfzcC5Mc2zA==
X-Received: by 2002:a05:6102:5e94:b0:76b:12e9:a443 with SMTP id ada2fe7eead31-76db7a95c81mr1319322137.9.1786613109376;
        Thu, 13 Aug 2026 02:25:09 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becc973d3sm615911241.11.2026.08.13.02.25.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:25:08 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-746d77537f8so984924137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:25:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZr0CiF7ydXRii4oyuecbfuKBkQjs0O3RLHs6sf9yWeogxu1A40kCVFFjWMbty20F27ZYdCVTkIaN7uQPqgvq+mg==@vger.kernel.org
X-Received: by 2002:a05:6102:6441:b0:739:15ef:cdfb with SMTP id
 ada2fe7eead31-76db5c7dafcmr1351180137.5.1786613107801; Thu, 13 Aug 2026
 02:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:24:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZqUkbc7KkLtz8gkecc_sN6tWPGL-2RHr8bck2YaTC7g@mail.gmail.com>
X-Gm-Features: AUfX_mxVPm_3gsxNaBlrWbODICSVqywR-fBDbmO_OI6j9jQTtSFIdCtCQE0EErQ
Message-ID: <CAMuHMdXZqUkbc7KkLtz8gkecc_sN6tWPGL-2RHr8bck2YaTC7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: r9a09g077: Add DU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Display Unit (DU) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
