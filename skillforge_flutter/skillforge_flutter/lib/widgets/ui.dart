import 'package:flutter/material.dart';

const bg = Color(0xFF090D16);
const panel = Color(0xFF121827);
const panel2 = Color(0xFF182033);
const accent = Color(0xFF7CFFB2);
const blue = Color(0xFF70A7FF);
const muted = Color(0xFF8B95AA);

class SkillForgeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; final String? subtitle;
  const SkillForgeAppBar({super.key, required this.title, this.subtitle});
  @override Size get preferredSize => const Size.fromHeight(74);
  @override Widget build(BuildContext context) => AppBar(backgroundColor:bg, elevation:0, titleSpacing:20, title:Column(crossAxisAlignment:CrossAxisAlignment.start, mainAxisAlignment:MainAxisAlignment.center, children:[Text(title,style:const TextStyle(fontSize:22,fontWeight:FontWeight.w800)), if(subtitle!=null) Text(subtitle!,style:const TextStyle(fontSize:12,color:muted))]));
}

class GlassCard extends StatelessWidget { final Widget child; final EdgeInsets padding; const GlassCard({super.key,required this.child,this.padding=const EdgeInsets.all(16)}); @override Widget build(BuildContext c)=>Container(padding:padding,decoration:BoxDecoration(color:panel,borderRadius:BorderRadius.circular(22),border:Border.all(color:Colors.white.withOpacity(.06))),child:child); }

class ProgressRing extends StatelessWidget { final double value; final double size; const ProgressRing({super.key,required this.value,this.size=64}); @override Widget build(BuildContext c)=>SizedBox(width:size,height:size,child:Stack(alignment:Alignment.center,children:[CircularProgressIndicator(value:value,strokeWidth:7,backgroundColor:panel2,valueColor:const AlwaysStoppedAnimation(accent)),Text('${(value*100).round()}%',style:const TextStyle(fontWeight:FontWeight.w800))])); }

class Pill extends StatelessWidget { final String text; final Color color; const Pill(this.text,{super.key,this.color=blue}); @override Widget build(BuildContext c)=>Container(padding:const EdgeInsets.symmetric(horizontal:10,vertical:6),decoration:BoxDecoration(color:color.withOpacity(.12),borderRadius:BorderRadius.circular(30)),child:Text(text,style:TextStyle(color:color,fontSize:11,fontWeight:FontWeight.w700))); }
