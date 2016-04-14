Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 14 Apr 2016 11:01:28 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Laurent <laurent.pinchart@ideasonboard.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Linux-DT <devicetree@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon <horms@verge.net.au>
Subject: Re: [alsa-devel] [PATCH 0/4] ASoC: add graph base connection on
 simple-card
Message-Id: <20160414110128.56a0da97d526cdcb8d5f1ddf@free.fr>
In-Reply-To: <871t68wxxe.wl%kuninori.morimoto.gx@renesas.com>
References: <871t68wxxe.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 14 Apr 2016 05:45:41 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Current simple-card is using "sound-dai" base connection on DT,
> but V4L2 is using graph base connection.
> For example HDMI case, we would like to use both connection.
> To above confusable connection method, and to reuse current resource,
> this patch adds new function, and detect both "sound-dai" and "remote-endpoint"
> on simple-card. like this
> 
> 	sound {
> 		compatible = "simple-audio-card";
> 		...
> 		sndcpu: simple-audio-card,cpu {
> 			sound-dai = <&xxx>;
> 		};
> 		sndcodec: simple-audio-card,codec {
> =>			remote-endpoint = <&out_hdmi>;
> 		};
> 	};
> 
> 	xxx {
> 		...
> 		ports {
> 			...
> 			port@0 {
> 				reg = <0>;
> 				out_rgb: endpoint {
> 				};
> 			};
> 			port@1 {
> 				reg = <1>;
> =>				out_hdmi: endpoint {
> 				};
> 			};
> 			...
> 		};
> 	};
	[snip]

Hi Kuninori,

Thanks for this first step towards the graph of ports in audio,
but I don't see exactly the use of this remote-endpoint.

According to Documentation/devicetree/bindings/graph.txt section
"Links between endpoints", the endpoint/remote-endpoint links are
bi-directional and describe the physical links: the audio port of the
codec is connected to the audio controller and reverse.
There is no reverse link from the codec to the 'simple-card'.

If the codec has only one DAI, using the remote-port just complexifies
the access to the codec (remote-port -> endpoint -> parent [->parent]).

If the codec has more than one audio input, a DT may look like:

	hdmi_transmitter {
		...
		port@1 {			/* audio from I2S */
			reg = <1>;
			...
			i2s: endpoint {
				remote-endpoint = <&audio_i2s>;
			};
		};
		port@2 {			 /* audio from S/PDIF */
			reg = <2>;
			...
			spdif: endpoint {
				remote-endpoint = <&audio_spdif>;
			};
		};
	};
(the video port is not shown and may be declared before, between or
after the audio ports)

The codec associated to the HDMI transmitter declares 2 DAIs.
It may choose to define the DAI numbers either in a fixed order
(say 0 is always S/PDIF and 1 is always I2S), or dynamically, following
the declaration of the ports (in the example, 0 is I2S and 1 is S/PDIF).

As the DAI numbers are used by the simple card to get the DAI names,
their values must be know.

With the standard declaration of the codec DAIs in the simple card
(phandle to the codec - hdmi -  plus DAI number), either numbering
scheme works (the documentation of the hdmi transmitter tells which
scheme is used and the DAI number in the DT is set accordingly).

When using a phandle to the remote-endpoint (without DAI number), the
simple card has no direct way to find the DAI number:
- with a fixed order, some more information must be set in the DT
  (audio port type),
- with a dynamic order, a loop on all ports must be done, counting the
  audio ports and skipping the video port(s).

-- 
Ken ar c'henta�	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
