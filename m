Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6415835B623
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 13:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522249; cv=none; b=YenfkYKJdh6vEudkEJeJQlkrjiPni2x5IjUpCgv33miweMwUaNpczInTfCsgzhUNbyUeWy6U+omySx0KswutB91j1J/DT1l3j2eRaOpjgun0TTso3G3B2YUw3yIbZgr2mQTj7+37dlgZF9cZkZ09T2g2+St4xiljb2A1G9aXtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522249; c=relaxed/simple;
	bh=CqxlbIALm6Hh+VY/KHyTOXJyg+eOFZZgrK/8Nd9qlfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3djSyPggn796g1VxgbrD0TsUXSpV/h9G1BXNvsxwSdAuVMU05grRWZBNStPorgMmytpVnJj/lKwfKAHS6Q4BK8buhrpvBgXQyJtUU2o7LNV+J5juj6eXPp8BFT50F9cpCB/8YCEOcBtisXnmQtqA30QTJShZS4WEJCGj5KCqn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5636784884eso1221632e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 05:57:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522247; x=1770127047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75PQCFMMISya6miWyFTo5NFlD+yMTmEC4MBoTSgZA6E=;
        b=CRxcKHJntFXS2v3juiCKLs2adLQtyjBeWwIkWlsN4vXeD6xE/nBlT5OVu2AfwDi2FD
         0sIxUOOuIAzIMXUkKGtPcyB5OA7XxD3HYJdRNvqun8h/avUQU3GgJkdQHTrjohnx9Dex
         h4jzvC7WxLX0T+K8ZU7ObyEYG6O+fm43Pi9i4AuyQpwaAalKdtkEvlzvTymt4ciltA/a
         7Ueexm2qJUS+XwrFh5/4SESA7Co310lxSteKqkbeHk+dLbgz3CgViRkzs+okAJi69LTw
         fW8EZUifE2Ao5zedhWwfcpUE0U6wEDgj7lVFyDV4bR86yNqDwvkMDUL2/C+24h8arhDm
         xdzg==
X-Forwarded-Encrypted: i=1; AJvYcCVA0MeKOvc9E9z0+ncizbl78LRodlK96aOzxzXEHhALLv2Kmd5tH5faJ6vDzpzvYDJNhC63fyCM9111O661XA89LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL7vvD4Ug5OKnum5XVYYgaUWkurHKuRehiu72TH6hoQHhmVqUV
	EIJ8QO4Q0+5nEGEuJAgnFcnnHS4TSIO+Xu+o/0Dy/ti6eN3mOgrPqXXQh7+3j60I
X-Gm-Gg: AZuq6aL3pirWgOilEJeBueU+P+bvxZxo9K6I+lYv/qZsaaq9zWDJtYlJMozp877+sOv
	9b19N0S8/9upfaM6EHQhT7Zq2JNU5+2/QsY2DNfD01upn/VDNjqXqps3Qwk6qIsAY8QVvJbtvfC
	i8k9AyLdYTqSZsJQl/c2FPoJUPWtNQ/MD0cqMjLSPbej9SQ5aYEqBdktpyALeyelvgZnUMowWGW
	f/ppqHfFEE2Ox5Rj5UgOBVaTveAVpk8yM47EqHHBzRWXXjNdy6X26CqQg8ySAm5WUkyOS8P39+s
	ymwaCMOs9LkHpAEENEkCl5XgthW7N1N0yz/b3+zsC3hEPoTsQvXT3lZIRT8oIaR7CqPfSD94Vjr
	dqn26zl2vjtWxv1sgXlpT//KpBKu55CjEwrT1Sq6ov0yjHLmyNy7PQjbogcwu/7ia3e32i3ipvg
	PDSm5Z8pftOccJHGWS8jvvhti0ipstiDDq6dJTn2V9xbtFx0DLJCFR
X-Received: by 2002:a05:6102:dd0:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-5f723789011mr750416137.27.1769522247260;
        Tue, 27 Jan 2026 05:57:27 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d3d27d2sm2401411137.1.2026.01.27.05.57.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 05:57:26 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56646a34c18so1398514e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 05:57:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI6t+CqnsIlEeNrRns0DCjB6JKFv93At0Pj0Il5Xey0A/LjMODKoDkTf73yfZelSX/64476xKXvv/oVKj5U176Hw==@vger.kernel.org
X-Received: by 2002:a05:6122:78b:b0:563:8339:6201 with SMTP id
 71dfb90a1353d-566795e7f59mr418577e0c.17.1769522244153; Tue, 27 Jan 2026
 05:57:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk> <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
In-Reply-To: <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 14:57:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
X-Gm-Features: AZwV_QgbBo9gCTeM_9WEMxs9EnfZIFfAoe0fWXmaoPkXJK4PoXh0OCn_st1Xl0A
Message-ID: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: stmmac: Preserve bootloader MAC address
 across unconditional reset
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, 27 Jan 2026 at 14:39, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Jan 26, 2026 at 6:11=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Mon, Jan 26, 2026 at 05:25:03PM +0000, Prabhakar wrote:
> > where "local-mac-address" states the MAC address to be used for eth0,
> > as specified by the boot loader.
> >
> Thanks for the pointer, I will use the above-mentioned method with
> which we won't be needing this patch on the RZ/T2H platform.

This should already work out-of-the-box, as
arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi already has:

    aliases {
            ethernet3 =3D &gmac1;
            ethernet2 =3D &gmac2;

So just make sure to set the "eth2addr" and "eth3addr" environment
variables in U-Boot.

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
