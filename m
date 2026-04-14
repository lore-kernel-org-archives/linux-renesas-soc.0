Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CCB3D47AA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162037; cv=none; b=PbA6YQEbIZaAbYqr6NY4Jm31rUZC+FXT9txHsvlEsMrK1ix5m0QLWfcH6RenskbU0Vj3BLgSRBdrmDFJhOsfUzTL5C2qbg+gDhLd43sSYfOLIQY0W/7CBh9dpXxzN/libUN+Zi4clJx72xteJ7V5YvSkMezlBwVrIyYKvb/0Tys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162037; c=relaxed/simple;
	bh=w4RU3LbA8U81TCj411ChOJb2AxIw+5nh+I9X8CndoHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDXwc+UJ1fxCawWMriiGa3R707PSO00pBL4CgwQpYLvvtHTOVzqu60oVHO+K//XgxEOcQ/r6CY5ac8DEL/lJprm039zzSP7erFt82LXZYppViK1R9No2HnX9SaVJr4yT1dgXnwNWBmz9XWzr/qFDyQAAhAje0ju8EwBnfUsQnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-953c5738c03so3229792241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 03:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162031; x=1776766831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1PSSGgZqIviWrUMA+aGkWAd7pcIuv8HlmdSZUkq2R0=;
        b=X+5kiXXUqP0bwXW7cEYmsVZsY0vFYwaDlJAeGbGtdySfe3nNV78oTNbxIfjRA4owTi
         y63tYinqrGzanpUTdXAXBNnzsBTY4JmYbPRAe0mGtm4ZDr3YLiKYliysBRy+TuQ5d+Hc
         xjrAORN+TZ1CxKGog/G610c2WCZc6pCAD6uyxxO9g4/dwJeIa8sgVUuoi8jorcDd31vZ
         516RDSTAp4aHIAwhmSPWVZJGn/lHm7FmPk4VfIE794vxqs+GOanceuq4+ApbKAVDTRAB
         xGnL3SzW7HIw0Fu7fqI2A6numiuQ8ttJdxsi3I01Z++8b6qeal3qFpLkJebH8Z9ik9gq
         L1sA==
X-Forwarded-Encrypted: i=1; AFNElJ+dZwsrMvE+FhXLwfJNuyJO4u12I2KwFdJNtfJAzneo+J7WSGbbwmL5J4chIhJYuse0N3CgtuDStZqb8FR5B+nUCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rwcRipq0VEVTEAK0BklcOY4LLdv51dk+nuwiamQLYBcxf2Q8
	L1dNaMX8LaPbruuWrpMBDoSLfB8ay5thE222ofo3vkSJ9a9OknzdjrZD4odxkHT/
X-Gm-Gg: AeBDies0VJFNg0tSosFbvvmNK4E+Ys480q2OEvfyIOOoBJ3A86nXjIfo57aAeyzHOyB
	S6zsMorWDHKF1pL2RqZ+AgXmLWp2nGI36Q/jgrRLe3STm5ilI2TVpQBHtitWK8JSur9nanz4WrA
	dgBk2lqQpUB1/7fP66WZr78Fh3q4pordH8NLUgyBmU+aaMVQaSjGx5+ousz35fQbNHApQf4+o5O
	k3AQ1hTQ6Besvy/9vQfW6RpRQrBV2oKbhUcOEmSLcVIshoTherYjp/K+8tUuUoeoMZMxYhhP9pj
	6X/PYfWrurfA8wrtblrVY4miYP34ngN621wzZK9TFdPTzY1HNYCJJsog7sq2/YYt6cIa+tG9Wh6
	Pi6+3fCMgdDGU64uvKTKHhe2OjbH1PO4Obf4GS8KVOFupUEmC2PGZqC+m0APrae53O5/RCcVwqX
	MEly0T/rNT/GES3gP6IdnOGrC3OFwwllCvP0avGy4cnv0gZLZmbIoU7VZ0/iTY
X-Received: by 2002:a67:e704:0:b0:602:9977:a4fe with SMTP id ada2fe7eead31-60a00f38c36mr7453937137.19.1776162031251;
        Tue, 14 Apr 2026 03:20:31 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-609d8c59d5bsm7913061137.2.2026.04.14.03.20.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:20:31 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-953c5738c03so3229782241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Apr 2026 03:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8OrBCRsFp8ldKza6ivJoD0ZETyfXxwLPRd0TQSSX2+YTYCUhSJ4lBTWlOdmvPqCXGBh77MB/o77fQQRZYxbsVSgw==@vger.kernel.org
X-Received: by 2002:a67:e70d:0:b0:603:1a8a:c84a with SMTP id
 ada2fe7eead31-609fecb952fmr7637834137.2.1776162030603; Tue, 14 Apr 2026
 03:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412173213.3179426-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260412173213.3179426-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Apr 2026 12:20:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLp=vz5qgOx-N9Pf_FC9o3AsdDXq8Uhu+rW+h6__4vFw@mail.gmail.com>
X-Gm-Features: AQROBzALmSC5WPRkCgFTwaDsUgYaBeV27KPyK6fy-gnOYEKtgB1RvcJLdAOt3Hg
Message-ID: <CAMuHMdWLp=vz5qgOx-N9Pf_FC9o3AsdDXq8Uhu+rW+h6__4vFw@mail.gmail.com>
Subject: Re: [PATCH net] net: ethernet: ravb: Do not check URAM suspension
 when WoL is active
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 12 Apr 2026 at 19:33, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> When updating the driver to match latest datasheet to suspend access to
> URAM when suspending DMA transfers a corner-case was missed, URAM access
> will not be suspended if WoL is enabled. This lead to the error message
> (correctly) being triggered as URAM access is not suspended even tho
> it's requested as part of stopping DMA.
>
> Avoid checking if URAM access is suspended and printing the error
> message if WoL is enabled when we suspend the system, as we know it will
> not be.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/all/CAMuHMdWnjV%3DHGE1o08zLhUfTgOSene5fYx=
1J5GG10mB%2BToq8qg@mail.gmail.com/
> Fixes: 353d8e7989b6 ("net: ethernet: ravb: Suspend and resume the transmi=
ssion flow")
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
